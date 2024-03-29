package datashare.rd;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.RandomAccessFile;

public class BufferedRandomAccessFile extends RandomAccessFile {

  //static ResourceBundle res = ResourceBundle.getBundle("kbps.io.Res");
  private static final int DEFAULT_BUFFER_BIT_LEN = 10;
  //private static final int DEFAULT_BUFFER_SIZE = 1 << DEFAULT_BUFFER_BIT_LEN;

  protected byte buf[];
  protected int bufBitLen;
  protected int bufSize;
  protected long bufMask;
  protected boolean bufDirty;
  protected int bufUsedSize;
  protected long curPos;

  protected long bufStartPos;
  protected long bufEndPos;
  protected long fileEndPos;

  protected boolean append;
  protected String filename;
  protected long initFileLen;

  public BufferedRandomAccessFile(String name) throws  IOException {
      this(name, "r", DEFAULT_BUFFER_BIT_LEN);
  }

  public BufferedRandomAccessFile(File file) throws IOException, FileNotFoundException {
      this(file.getPath(), "r", DEFAULT_BUFFER_BIT_LEN);
  }

  public BufferedRandomAccessFile(String name, int bufBitLen) throws  IOException {
      this(name, "r", bufBitLen);
  }

  public BufferedRandomAccessFile(File file, int bufBitLen) throws IOException, FileNotFoundException {
      this(file.getPath(), "r", bufBitLen);
  }

  public BufferedRandomAccessFile(String name, String mode) throws IOException {
      this(name, mode, DEFAULT_BUFFER_BIT_LEN);
  }

  public BufferedRandomAccessFile(File file, String mode) throws IOException, FileNotFoundException {
      this(file.getPath(), mode, DEFAULT_BUFFER_BIT_LEN);
  }

  public BufferedRandomAccessFile(String name, String mode, int bufBitLen) throws IOException  {
      super(name, mode);
      this.init(name, mode, bufBitLen);
  }

  public BufferedRandomAccessFile(File file, String mode, int bufBitLen) throws IOException, FileNotFoundException {
      this(file.getPath(), mode, bufBitLen);
  }

  private void init(String name, String mode, int bufBitLen) throws IOException {
      if (mode.equals("r") == true) {
          this.append = false;
      } else {
          this.append = true;
      }

      this.filename = name;
      this.initFileLen = super.length();
      this.fileEndPos = this.initFileLen - 1;
      this.curPos = super.getFilePointer();

      if (bufBitLen < 0) {
          throw new IllegalArgumentException("bufBitLen must be more than zero.");
      }

      this.bufBitLen = bufBitLen;
      this.bufSize = 1 << bufBitLen;
      this.buf = new byte[this.bufSize];
      this.bufMask = ~((long)this.bufSize - 1L);
      this.bufDirty = false;
      this.bufUsedSize = 0;
      this.bufStartPos = -1;
      this.bufEndPos = -1;
  }

  private void flushBuf() throws IOException {
      if (this.bufDirty == true) {
          if (super.getFilePointer() != this.bufStartPos) {
              super.seek(this.bufStartPos);
          }
          super.write(this.buf, 0, this.bufUsedSize);
          this.bufDirty = false;
      }
  }

  private int fillbuf() throws IOException {
      super.seek(this.bufStartPos);
      this.bufDirty = false;
      return super.read(this.buf);
  }

  public byte read(long pos) throws IOException {
      if (pos < this.bufStartPos || pos > this.bufEndPos) {
          this.flushBuf();
          this.seek(pos);

          if ((pos < this.bufStartPos) || (pos > this.bufEndPos)) {
              throw new IOException();
          }
      }
      this.curPos = pos;
      return this.buf[(int)(pos - this.bufStartPos)];
  }

  public boolean write(byte bw) throws IOException {
      return this.write(bw, this.curPos);
  }

  public boolean append(byte bw) throws IOException {
      return this.write(bw, this.fileEndPos + 1);
  }

  public boolean write(byte bw, long pos) throws IOException {

      if ((pos >= this.bufStartPos) && (pos <= this.bufEndPos)) { // write pos in buf
          this.buf[(int)(pos - this.bufStartPos)] = bw;
          this.bufDirty = true;

          if (pos == this.fileEndPos + 1) { // write pos is append pos
              this.fileEndPos++;
              this.bufUsedSize++;
          }
      } else { // write pos not in buf
          this.seek(pos);

          if ((pos >= 0) && (pos <= this.fileEndPos) && (this.fileEndPos != 0)) { // write pos is modify file
              this.buf[(int)(pos - this.bufStartPos)] = bw;

          } else if (((pos == 0) && (this.fileEndPos == 0)) || (pos == this.fileEndPos + 1)) { // write pos is append pos
              this.buf[0] = bw;
              this.fileEndPos++;
              this.bufUsedSize = 1;
          } else {
              throw new IndexOutOfBoundsException();
          }
          this.bufDirty = true;
      }
      this.curPos = pos;
      return true;
  }

  public void write(byte b[], int off, int len) throws IOException {

      long writeEndPos = this.curPos + len - 1;

      if (writeEndPos <= this.bufEndPos) { // b[] in cur buf
          System.arraycopy(b, off, this.buf, (int)(this.curPos - this.bufStartPos), len);
          this.bufDirty = true;
          this.bufUsedSize = (int)(writeEndPos - this.bufStartPos + 1);//(int)(this.curpos - this.bufstartpos + len - 1);

      } else { // b[] not in cur buf
          super.seek(this.curPos);
          super.write(b, off, len);
      }

      if (writeEndPos > this.fileEndPos)
          this.fileEndPos = writeEndPos;

      this.seek(writeEndPos+1);
  }

  public int read(byte b[], int off, int len) throws IOException {

      long readEndPos = this.curPos + len - 1;

      if (readEndPos <= this.bufEndPos && readEndPos <= this.fileEndPos ) { // read in buf
          System.arraycopy(this.buf, (int)(this.curPos - this.bufStartPos), b, off, len);
      } else { // read b[] size > buf[]

          if (readEndPos > this.fileEndPos) { // read b[] part in file
              len = (int)(this.length() - this.curPos + 1);
          }

          super.seek(this.curPos);
          len = super.read(b, off, len);
          readEndPos = this.curPos + len - 1;
      }
      this.seek(readEndPos + 1);
      return len;
  }

  public void write(byte b[]) throws IOException {
      this.write(b, 0, b.length);
  }

  public int read(byte b[]) throws IOException {
      return this.read(b, 0, b.length);
  }

  public void seek(long pos) throws IOException {

      if ((pos < this.bufStartPos) || (pos > this.bufEndPos)) { // seek pos not in buf
          this.flushBuf();

          if ((pos >= 0) && (pos <= this.fileEndPos) && (this.fileEndPos != 0)) { // seek pos in file (file length > 0)
              this.bufStartPos =  pos & this.bufMask;
              this.bufUsedSize = this.fillbuf();

          } else if (((pos == 0) && (this.fileEndPos == 0)) || (pos == this.fileEndPos + 1)) { // seek pos is append pos

              this.bufStartPos = pos;
              this.bufUsedSize = 0;
          }
          this.bufEndPos = this.bufStartPos + this.bufSize - 1;
      }
      this.curPos = pos;
  }

  public long length() throws IOException {
      return this.max(this.fileEndPos + 1, this.initFileLen);
  }

  public void setLength(long newLength) throws IOException {
      if (newLength > 0) {
          this.fileEndPos = newLength - 1;
      } else {
          this.fileEndPos = 0;
      }
      super.setLength(newLength);
  }
  public long getFilePointer() throws IOException {
      return this.curPos;
  }

  private long max(long a, long b) {
      if (a > b) return a;
      return b;
  }

  public void close() throws IOException {
      this.flushBuf();
      super.close();
  }
//For test
  public static void main(String[] args) throws IOException {
      long readfilelen = 0;
      BufferedRandomAccessFile brafReadFile, brafWriteFile;

      brafReadFile = new BufferedRandomAccessFile("C:\\WINNT\\Fonts\\STKAITI.TTF");
      readfilelen = brafReadFile.initFileLen;
      brafWriteFile = new BufferedRandomAccessFile(".\\STKAITI.001", "rw", 10);

      byte buf[] = new byte[1024];
      int readcount;

      long start = System.currentTimeMillis();

      while((readcount = brafReadFile.read(buf)) != -1) {
          brafWriteFile.write(buf, 0, readcount);
      }

      brafWriteFile.close();
      brafReadFile.close();

      System.out.println("BufferedRandomAccessFile Copy & Write File: "
                         + brafReadFile.filename
                         + "    FileSize: "
                         + java.lang.Integer.toString((int)readfilelen >> 1024)
                         + " (KB)    "
                         + "Spend: "
                         +(double)(System.currentTimeMillis()-start) / 1000
                         + "(s)");

      java.io.FileInputStream fdin = new java.io.FileInputStream("C:\\WINNT\\Fonts\\STKAITI.TTF");
      java.io.BufferedInputStream bis = new java.io.BufferedInputStream(fdin, 1024);
      java.io.DataInputStream dis = new java.io.DataInputStream(bis);

      java.io.FileOutputStream fdout = new java.io.FileOutputStream(".\\STKAITI.002");
      java.io.BufferedOutputStream bos = new java.io.BufferedOutputStream(fdout, 1024);
      java.io.DataOutputStream dos = new java.io.DataOutputStream(bos);

      start = System.currentTimeMillis();

      for (int i = 0; i < readfilelen; i++) {
          dos.write(dis.readByte());
      }

      dos.close();
      dis.close();

      System.out.println("DataBufferedios Copy & Write File: "
                         + brafReadFile.filename
                         + "    FileSize: "
                         + java.lang.Integer.toString((int)readfilelen >> 1024)
                         + " (KB)    "
                         + "Spend: "
                         + (double)(System.currentTimeMillis()-start) / 1000
                         + "(s)");
  }
}
