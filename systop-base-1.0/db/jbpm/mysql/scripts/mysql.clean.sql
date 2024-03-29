alter table JBPM_ACTION drop foreign key FK_ACTION_EVENT;
alter table JBPM_ACTION drop foreign key FK_ACTION_EXPTHDL;
alter table JBPM_ACTION drop foreign key FK_ACTION_PROCDEF;
alter table JBPM_ACTION drop foreign key FK_CRTETIMERACT_TA;
alter table JBPM_ACTION drop foreign key FK_ACTION_ACTNDEL;
alter table JBPM_ACTION drop foreign key FK_ACTION_REFACT;
alter table JBPM_BYTEARRAY drop foreign key FK_BYTEARR_FILDEF;
alter table JBPM_BYTEBLOCK drop foreign key FK_BYTEBLOCK_FILE;
alter table JBPM_COMMENT drop foreign key FK_COMMENT_TOKEN;
alter table JBPM_COMMENT drop foreign key FK_COMMENT_TSK;
alter table JBPM_DECISIONCONDITIONS drop foreign key FK_DECCOND_DEC;
alter table JBPM_DELEGATION drop foreign key FK_DELEGATION_PRCD;
alter table JBPM_EVENT drop foreign key FK_EVENT_PROCDEF;
alter table JBPM_EVENT drop foreign key FK_EVENT_NODE;
alter table JBPM_EVENT drop foreign key FK_EVENT_TRANS;
alter table JBPM_EVENT drop foreign key FK_EVENT_TASK;
alter table JBPM_ID_GROUP drop foreign key FK_ID_GRP_PARENT;
alter table JBPM_ID_MEMBERSHIP drop foreign key FK_ID_MEMSHIP_GRP;
alter table JBPM_ID_MEMBERSHIP drop foreign key FK_ID_MEMSHIP_USR;
alter table JBPM_LOG drop foreign key FK_LOG_SOURCENODE;
alter table JBPM_LOG drop foreign key FK_LOG_TOKEN;
alter table JBPM_LOG drop foreign key FK_LOG_OLDBYTES;
alter table JBPM_LOG drop foreign key FK_LOG_NEWBYTES;
alter table JBPM_LOG drop foreign key FK_LOG_CHILDTOKEN;
alter table JBPM_LOG drop foreign key FK_LOG_DESTNODE;
alter table JBPM_LOG drop foreign key FK_LOG_TASKINST;
alter table JBPM_LOG drop foreign key FK_LOG_SWIMINST;
alter table JBPM_LOG drop foreign key FK_LOG_PARENT;
alter table JBPM_LOG drop foreign key FK_LOG_NODE;
alter table JBPM_LOG drop foreign key FK_LOG_ACTION;
alter table JBPM_LOG drop foreign key FK_LOG_VARINST;
alter table JBPM_LOG drop foreign key FK_LOG_TRANSITION;
alter table JBPM_MESSAGE drop foreign key FK_MSG_TOKEN;
alter table JBPM_MESSAGE drop foreign key FK_CMD_NODE;
alter table JBPM_MESSAGE drop foreign key FK_CMD_ACTION;
alter table JBPM_MESSAGE drop foreign key FK_CMD_TASKINST;
alter table JBPM_MODULEDEFINITION drop foreign key FK_TSKDEF_START;
alter table JBPM_MODULEDEFINITION drop foreign key FK_MODDEF_PROCDEF;
alter table JBPM_MODULEINSTANCE drop foreign key FK_TASKMGTINST_TMD;
alter table JBPM_MODULEINSTANCE drop foreign key FK_MODINST_PRCINST;
alter table JBPM_NODE drop foreign key FK_PROCST_SBPRCDEF;
alter table JBPM_NODE drop foreign key FK_NODE_PROCDEF;
alter table JBPM_NODE drop foreign key FK_NODE_ACTION;
alter table JBPM_NODE drop foreign key FK_DECISION_DELEG;
alter table JBPM_NODE drop foreign key FK_NODE_SUPERSTATE;
alter table JBPM_POOLEDACTOR drop foreign key FK_POOLEDACTOR_SLI;
alter table JBPM_PROCESSDEFINITION drop foreign key FK_PROCDEF_STRTSTA;
alter table JBPM_PROCESSINSTANCE drop foreign key FK_PROCIN_PROCDEF;
alter table JBPM_PROCESSINSTANCE drop foreign key FK_PROCIN_ROOTTKN;
alter table JBPM_PROCESSINSTANCE drop foreign key FK_PROCIN_SPROCTKN;
alter table JBPM_RUNTIMEACTION drop foreign key FK_RTACTN_PROCINST;
alter table JBPM_RUNTIMEACTION drop foreign key FK_RTACTN_ACTION;
alter table JBPM_SWIMLANE drop foreign key FK_SWL_ASSDEL;
alter table JBPM_SWIMLANE drop foreign key FK_SWL_TSKMGMTDEF;
alter table JBPM_SWIMLANEINSTANCE drop foreign key FK_SWIMLANEINST_TM;
alter table JBPM_SWIMLANEINSTANCE drop foreign key FK_SWIMLANEINST_SL;
alter table JBPM_TASK drop foreign key FK_TSK_TSKCTRL;
alter table JBPM_TASK drop foreign key FK_TASK_ASSDEL;
alter table JBPM_TASK drop foreign key FK_TASK_TASKNODE;
alter table JBPM_TASK drop foreign key FK_TASK_PROCDEF;
alter table JBPM_TASK drop foreign key FK_TASK_STARTST;
alter table JBPM_TASK drop foreign key FK_TASK_TASKMGTDEF;
alter table JBPM_TASK drop foreign key FK_TASK_SWIMLANE;
alter table JBPM_TASKACTORPOOL drop foreign key FK_TSKACTPOL_PLACT;
alter table JBPM_TASKACTORPOOL drop foreign key FK_TASKACTPL_TSKI;
alter table JBPM_TASKCONTROLLER drop foreign key FK_TSKCTRL_DELEG;
alter table JBPM_TASKINSTANCE drop foreign key FK_TASKINST_TMINST;
alter table JBPM_TASKINSTANCE drop foreign key FK_TASKINST_TOKEN;
alter table JBPM_TASKINSTANCE drop foreign key FK_TASKINST_SLINST;
alter table JBPM_TASKINSTANCE drop foreign key FK_TASKINST_TASK;
alter table JBPM_TIMER drop foreign key FK_TIMER_TOKEN;
alter table JBPM_TIMER drop foreign key FK_TIMER_PRINST;
alter table JBPM_TIMER drop foreign key FK_TIMER_ACTION;
alter table JBPM_TIMER drop foreign key FK_TIMER_TSKINST;
alter table JBPM_TOKEN drop foreign key FK_TOKEN_PARENT;
alter table JBPM_TOKEN drop foreign key FK_TOKEN_NODE;
alter table JBPM_TOKEN drop foreign key FK_TOKEN_PROCINST;
alter table JBPM_TOKEN drop foreign key FK_TOKEN_SUBPI;
alter table JBPM_TOKENVARIABLEMAP drop foreign key FK_TKVARMAP_CTXT;
alter table JBPM_TOKENVARIABLEMAP drop foreign key FK_TKVARMAP_TOKEN;
alter table JBPM_TRANSITION drop foreign key FK_TRANSITION_TO;
alter table JBPM_TRANSITION drop foreign key FK_TRANS_PROCDEF;
alter table JBPM_TRANSITION drop foreign key FK_TRANSITION_FROM;
alter table JBPM_VARIABLEACCESS drop foreign key FK_VARACC_TSKCTRL;
alter table JBPM_VARIABLEACCESS drop foreign key FK_VARACC_SCRIPT;
alter table JBPM_VARIABLEACCESS drop foreign key FK_VARACC_PROCST;
alter table JBPM_VARIABLEINSTANCE drop foreign key FK_VARINST_TK;
alter table JBPM_VARIABLEINSTANCE drop foreign key FK_VARINST_TKVARMP;
alter table JBPM_VARIABLEINSTANCE drop foreign key FK_VARINST_PRCINST;
alter table JBPM_VARIABLEINSTANCE drop foreign key FK_VAR_TSKINST;
alter table JBPM_VARIABLEINSTANCE drop foreign key FK_BYTEINST_ARRAY;
delete from JBPM_ACTION;
delete from JBPM_BYTEARRAY;
delete from JBPM_BYTEBLOCK;
delete from JBPM_COMMENT;
delete from JBPM_DECISIONCONDITIONS;
delete from JBPM_DELEGATION;
delete from JBPM_EVENT;
delete from JBPM_EXCEPTIONHANDLER;
delete from JBPM_ID_GROUP;
delete from JBPM_ID_MEMBERSHIP;
delete from JBPM_ID_PERMISSIONS;
delete from JBPM_ID_USER;
delete from JBPM_LOG;
delete from JBPM_MESSAGE;
delete from JBPM_MODULEDEFINITION;
delete from JBPM_MODULEINSTANCE;
delete from JBPM_NODE;
delete from JBPM_POOLEDACTOR;
delete from JBPM_PROCESSDEFINITION;
delete from JBPM_PROCESSINSTANCE;
delete from JBPM_RUNTIMEACTION;
delete from JBPM_SWIMLANE;
delete from JBPM_SWIMLANEINSTANCE;
delete from JBPM_TASK;
delete from JBPM_TASKACTORPOOL;
delete from JBPM_TASKCONTROLLER;
delete from JBPM_TASKINSTANCE;
delete from JBPM_TIMER;
delete from JBPM_TOKEN;
delete from JBPM_TOKENVARIABLEMAP;
delete from JBPM_TRANSITION;
delete from JBPM_VARIABLEACCESS;
delete from JBPM_VARIABLEINSTANCE;
alter table JBPM_ACTION add index FK_ACTION_EVENT (EVENT_), add constraint FK_ACTION_EVENT foreign key (EVENT_) references JBPM_EVENT (ID_);
alter table JBPM_ACTION add index FK_ACTION_EXPTHDL (EXCEPTIONHANDLER_), add constraint FK_ACTION_EXPTHDL foreign key (EXCEPTIONHANDLER_) references JBPM_EXCEPTIONHANDLER (ID_);
alter table JBPM_ACTION add index FK_ACTION_PROCDEF (PROCESSDEFINITION_), add constraint FK_ACTION_PROCDEF foreign key (PROCESSDEFINITION_) references JBPM_PROCESSDEFINITION (ID_);
alter table JBPM_ACTION add index FK_CRTETIMERACT_TA (TIMERACTION_), add constraint FK_CRTETIMERACT_TA foreign key (TIMERACTION_) references JBPM_ACTION (ID_);
alter table JBPM_ACTION add index FK_ACTION_ACTNDEL (ACTIONDELEGATION_), add constraint FK_ACTION_ACTNDEL foreign key (ACTIONDELEGATION_) references JBPM_DELEGATION (ID_);
alter table JBPM_ACTION add index FK_ACTION_REFACT (REFERENCEDACTION_), add constraint FK_ACTION_REFACT foreign key (REFERENCEDACTION_) references JBPM_ACTION (ID_);
alter table JBPM_BYTEARRAY add index FK_BYTEARR_FILDEF (FILEDEFINITION_), add constraint FK_BYTEARR_FILDEF foreign key (FILEDEFINITION_) references JBPM_MODULEDEFINITION (ID_);
alter table JBPM_BYTEBLOCK add index FK_BYTEBLOCK_FILE (PROCESSFILE_), add constraint FK_BYTEBLOCK_FILE foreign key (PROCESSFILE_) references JBPM_BYTEARRAY (ID_);
alter table JBPM_COMMENT add index FK_COMMENT_TOKEN (TOKEN_), add constraint FK_COMMENT_TOKEN foreign key (TOKEN_) references JBPM_TOKEN (ID_);
alter table JBPM_COMMENT add index FK_COMMENT_TSK (TASKINSTANCE_), add constraint FK_COMMENT_TSK foreign key (TASKINSTANCE_) references JBPM_TASKINSTANCE (ID_);
alter table JBPM_DECISIONCONDITIONS add index FK_DECCOND_DEC (DECISION_), add constraint FK_DECCOND_DEC foreign key (DECISION_) references JBPM_NODE (ID_);
alter table JBPM_DELEGATION add index FK_DELEGATION_PRCD (PROCESSDEFINITION_), add constraint FK_DELEGATION_PRCD foreign key (PROCESSDEFINITION_) references JBPM_PROCESSDEFINITION (ID_);
alter table JBPM_EVENT add index FK_EVENT_PROCDEF (PROCESSDEFINITION_), add constraint FK_EVENT_PROCDEF foreign key (PROCESSDEFINITION_) references JBPM_PROCESSDEFINITION (ID_);
alter table JBPM_EVENT add index FK_EVENT_NODE (NODE_), add constraint FK_EVENT_NODE foreign key (NODE_) references JBPM_NODE (ID_);
alter table JBPM_EVENT add index FK_EVENT_TRANS (TRANSITION_), add constraint FK_EVENT_TRANS foreign key (TRANSITION_) references JBPM_TRANSITION (ID_);
alter table JBPM_EVENT add index FK_EVENT_TASK (TASK_), add constraint FK_EVENT_TASK foreign key (TASK_) references JBPM_TASK (ID_);
alter table JBPM_ID_GROUP add index FK_ID_GRP_PARENT (PARENT_), add constraint FK_ID_GRP_PARENT foreign key (PARENT_) references JBPM_ID_GROUP (ID_);
alter table JBPM_ID_MEMBERSHIP add index FK_ID_MEMSHIP_GRP (GROUP_), add constraint FK_ID_MEMSHIP_GRP foreign key (GROUP_) references JBPM_ID_GROUP (ID_);
alter table JBPM_ID_MEMBERSHIP add index FK_ID_MEMSHIP_USR (USER_), add constraint FK_ID_MEMSHIP_USR foreign key (USER_) references JBPM_ID_USER (ID_);
alter table JBPM_LOG add index FK_LOG_SOURCENODE (SOURCENODE_), add constraint FK_LOG_SOURCENODE foreign key (SOURCENODE_) references JBPM_NODE (ID_);
alter table JBPM_LOG add index FK_LOG_TOKEN (TOKEN_), add constraint FK_LOG_TOKEN foreign key (TOKEN_) references JBPM_TOKEN (ID_);
alter table JBPM_LOG add index FK_LOG_OLDBYTES (OLDBYTEARRAY_), add constraint FK_LOG_OLDBYTES foreign key (OLDBYTEARRAY_) references JBPM_BYTEARRAY (ID_);
alter table JBPM_LOG add index FK_LOG_NEWBYTES (NEWBYTEARRAY_), add constraint FK_LOG_NEWBYTES foreign key (NEWBYTEARRAY_) references JBPM_BYTEARRAY (ID_);
alter table JBPM_LOG add index FK_LOG_CHILDTOKEN (CHILD_), add constraint FK_LOG_CHILDTOKEN foreign key (CHILD_) references JBPM_TOKEN (ID_);
alter table JBPM_LOG add index FK_LOG_DESTNODE (DESTINATIONNODE_), add constraint FK_LOG_DESTNODE foreign key (DESTINATIONNODE_) references JBPM_NODE (ID_);
alter table JBPM_LOG add index FK_LOG_TASKINST (TASKINSTANCE_), add constraint FK_LOG_TASKINST foreign key (TASKINSTANCE_) references JBPM_TASKINSTANCE (ID_);
alter table JBPM_LOG add index FK_LOG_SWIMINST (SWIMLANEINSTANCE_), add constraint FK_LOG_SWIMINST foreign key (SWIMLANEINSTANCE_) references JBPM_SWIMLANEINSTANCE (ID_);
alter table JBPM_LOG add index FK_LOG_PARENT (PARENT_), add constraint FK_LOG_PARENT foreign key (PARENT_) references JBPM_LOG (ID_);
alter table JBPM_LOG add index FK_LOG_NODE (NODE_), add constraint FK_LOG_NODE foreign key (NODE_) references JBPM_NODE (ID_);
alter table JBPM_LOG add index FK_LOG_ACTION (ACTION_), add constraint FK_LOG_ACTION foreign key (ACTION_) references JBPM_ACTION (ID_);
alter table JBPM_LOG add index FK_LOG_VARINST (VARIABLEINSTANCE_), add constraint FK_LOG_VARINST foreign key (VARIABLEINSTANCE_) references JBPM_VARIABLEINSTANCE (ID_);
alter table JBPM_LOG add index FK_LOG_TRANSITION (TRANSITION_), add constraint FK_LOG_TRANSITION foreign key (TRANSITION_) references JBPM_TRANSITION (ID_);
alter table JBPM_MESSAGE add index FK_MSG_TOKEN (TOKEN_), add constraint FK_MSG_TOKEN foreign key (TOKEN_) references JBPM_TOKEN (ID_);
alter table JBPM_MESSAGE add index FK_CMD_NODE (NODE_), add constraint FK_CMD_NODE foreign key (NODE_) references JBPM_NODE (ID_);
alter table JBPM_MESSAGE add index FK_CMD_ACTION (ACTION_), add constraint FK_CMD_ACTION foreign key (ACTION_) references JBPM_ACTION (ID_);
alter table JBPM_MESSAGE add index FK_CMD_TASKINST (TASKINSTANCE_), add constraint FK_CMD_TASKINST foreign key (TASKINSTANCE_) references JBPM_TASKINSTANCE (ID_);
alter table JBPM_MODULEDEFINITION add index FK_TSKDEF_START (STARTTASK_), add constraint FK_TSKDEF_START foreign key (STARTTASK_) references JBPM_TASK (ID_);
alter table JBPM_MODULEDEFINITION add index FK_MODDEF_PROCDEF (PROCESSDEFINITION_), add constraint FK_MODDEF_PROCDEF foreign key (PROCESSDEFINITION_) references JBPM_PROCESSDEFINITION (ID_);
alter table JBPM_MODULEINSTANCE add index FK_TASKMGTINST_TMD (TASKMGMTDEFINITION_), add constraint FK_TASKMGTINST_TMD foreign key (TASKMGMTDEFINITION_) references JBPM_MODULEDEFINITION (ID_);
alter table JBPM_MODULEINSTANCE add index FK_MODINST_PRCINST (PROCESSINSTANCE_), add constraint FK_MODINST_PRCINST foreign key (PROCESSINSTANCE_) references JBPM_PROCESSINSTANCE (ID_);
alter table JBPM_NODE add index FK_PROCST_SBPRCDEF (SUBPROCESSDEFINITION_), add constraint FK_PROCST_SBPRCDEF foreign key (SUBPROCESSDEFINITION_) references JBPM_PROCESSDEFINITION (ID_);
alter table JBPM_NODE add index FK_NODE_PROCDEF (PROCESSDEFINITION_), add constraint FK_NODE_PROCDEF foreign key (PROCESSDEFINITION_) references JBPM_PROCESSDEFINITION (ID_);
alter table JBPM_NODE add index FK_NODE_ACTION (ACTION_), add constraint FK_NODE_ACTION foreign key (ACTION_) references JBPM_ACTION (ID_);
alter table JBPM_NODE add index FK_DECISION_DELEG (DECISIONDELEGATION), add constraint FK_DECISION_DELEG foreign key (DECISIONDELEGATION) references JBPM_DELEGATION (ID_);
alter table JBPM_NODE add index FK_NODE_SUPERSTATE (SUPERSTATE_), add constraint FK_NODE_SUPERSTATE foreign key (SUPERSTATE_) references JBPM_NODE (ID_);
alter table JBPM_POOLEDACTOR add index FK_POOLEDACTOR_SLI (SWIMLANEINSTANCE_), add constraint FK_POOLEDACTOR_SLI foreign key (SWIMLANEINSTANCE_) references JBPM_SWIMLANEINSTANCE (ID_);
alter table JBPM_PROCESSDEFINITION add index FK_PROCDEF_STRTSTA (STARTSTATE_), add constraint FK_PROCDEF_STRTSTA foreign key (STARTSTATE_) references JBPM_NODE (ID_);
alter table JBPM_PROCESSINSTANCE add index FK_PROCIN_PROCDEF (PROCESSDEFINITION_), add constraint FK_PROCIN_PROCDEF foreign key (PROCESSDEFINITION_) references JBPM_PROCESSDEFINITION (ID_);
alter table JBPM_PROCESSINSTANCE add index FK_PROCIN_ROOTTKN (ROOTTOKEN_), add constraint FK_PROCIN_ROOTTKN foreign key (ROOTTOKEN_) references JBPM_TOKEN (ID_);
alter table JBPM_PROCESSINSTANCE add index FK_PROCIN_SPROCTKN (SUPERPROCESSTOKEN_), add constraint FK_PROCIN_SPROCTKN foreign key (SUPERPROCESSTOKEN_) references JBPM_TOKEN (ID_);
alter table JBPM_RUNTIMEACTION add index FK_RTACTN_PROCINST (PROCESSINSTANCE_), add constraint FK_RTACTN_PROCINST foreign key (PROCESSINSTANCE_) references JBPM_PROCESSINSTANCE (ID_);
alter table JBPM_RUNTIMEACTION add index FK_RTACTN_ACTION (ACTION_), add constraint FK_RTACTN_ACTION foreign key (ACTION_) references JBPM_ACTION (ID_);
alter table JBPM_SWIMLANE add index FK_SWL_ASSDEL (ASSIGNMENTDELEGATION_), add constraint FK_SWL_ASSDEL foreign key (ASSIGNMENTDELEGATION_) references JBPM_DELEGATION (ID_);
alter table JBPM_SWIMLANE add index FK_SWL_TSKMGMTDEF (TASKMGMTDEFINITION_), add constraint FK_SWL_TSKMGMTDEF foreign key (TASKMGMTDEFINITION_) references JBPM_MODULEDEFINITION (ID_);
alter table JBPM_SWIMLANEINSTANCE add index FK_SWIMLANEINST_TM (TASKMGMTINSTANCE_), add constraint FK_SWIMLANEINST_TM foreign key (TASKMGMTINSTANCE_) references JBPM_MODULEINSTANCE (ID_);
alter table JBPM_SWIMLANEINSTANCE add index FK_SWIMLANEINST_SL (SWIMLANE_), add constraint FK_SWIMLANEINST_SL foreign key (SWIMLANE_) references JBPM_SWIMLANE (ID_);
alter table JBPM_TASK add index FK_TSK_TSKCTRL (TASKCONTROLLER_), add constraint FK_TSK_TSKCTRL foreign key (TASKCONTROLLER_) references JBPM_TASKCONTROLLER (ID_);
alter table JBPM_TASK add index FK_TASK_ASSDEL (ASSIGNMENTDELEGATION_), add constraint FK_TASK_ASSDEL foreign key (ASSIGNMENTDELEGATION_) references JBPM_DELEGATION (ID_);
alter table JBPM_TASK add index FK_TASK_TASKNODE (TASKNODE_), add constraint FK_TASK_TASKNODE foreign key (TASKNODE_) references JBPM_NODE (ID_);
alter table JBPM_TASK add index FK_TASK_PROCDEF (PROCESSDEFINITION_), add constraint FK_TASK_PROCDEF foreign key (PROCESSDEFINITION_) references JBPM_PROCESSDEFINITION (ID_);
alter table JBPM_TASK add index FK_TASK_STARTST (STARTSTATE_), add constraint FK_TASK_STARTST foreign key (STARTSTATE_) references JBPM_NODE (ID_);
alter table JBPM_TASK add index FK_TASK_TASKMGTDEF (TASKMGMTDEFINITION_), add constraint FK_TASK_TASKMGTDEF foreign key (TASKMGMTDEFINITION_) references JBPM_MODULEDEFINITION (ID_);
alter table JBPM_TASK add index FK_TASK_SWIMLANE (SWIMLANE_), add constraint FK_TASK_SWIMLANE foreign key (SWIMLANE_) references JBPM_SWIMLANE (ID_);
alter table JBPM_TASKACTORPOOL add index FK_TSKACTPOL_PLACT (POOLEDACTOR_), add constraint FK_TSKACTPOL_PLACT foreign key (POOLEDACTOR_) references JBPM_POOLEDACTOR (ID_);
alter table JBPM_TASKACTORPOOL add index FK_TASKACTPL_TSKI (TASKINSTANCE_), add constraint FK_TASKACTPL_TSKI foreign key (TASKINSTANCE_) references JBPM_TASKINSTANCE (ID_);
alter table JBPM_TASKCONTROLLER add index FK_TSKCTRL_DELEG (TASKCONTROLLERDELEGATION_), add constraint FK_TSKCTRL_DELEG foreign key (TASKCONTROLLERDELEGATION_) references JBPM_DELEGATION (ID_);
alter table JBPM_TASKINSTANCE add index FK_TASKINST_TMINST (TASKMGMTINSTANCE_), add constraint FK_TASKINST_TMINST foreign key (TASKMGMTINSTANCE_) references JBPM_MODULEINSTANCE (ID_);
alter table JBPM_TASKINSTANCE add index FK_TASKINST_TOKEN (TOKEN_), add constraint FK_TASKINST_TOKEN foreign key (TOKEN_) references JBPM_TOKEN (ID_);
alter table JBPM_TASKINSTANCE add index FK_TASKINST_SLINST (SWIMLANINSTANCE_), add constraint FK_TASKINST_SLINST foreign key (SWIMLANINSTANCE_) references JBPM_SWIMLANEINSTANCE (ID_);
alter table JBPM_TASKINSTANCE add index FK_TASKINST_TASK (TASK_), add constraint FK_TASKINST_TASK foreign key (TASK_) references JBPM_TASK (ID_);
alter table JBPM_TIMER add index FK_TIMER_TOKEN (TOKEN_), add constraint FK_TIMER_TOKEN foreign key (TOKEN_) references JBPM_TOKEN (ID_);
alter table JBPM_TIMER add index FK_TIMER_PRINST (PROCESSINSTANCE_), add constraint FK_TIMER_PRINST foreign key (PROCESSINSTANCE_) references JBPM_PROCESSINSTANCE (ID_);
alter table JBPM_TIMER add index FK_TIMER_ACTION (ACTION_), add constraint FK_TIMER_ACTION foreign key (ACTION_) references JBPM_ACTION (ID_);
alter table JBPM_TIMER add index FK_TIMER_TSKINST (TASKINSTANCE_), add constraint FK_TIMER_TSKINST foreign key (TASKINSTANCE_) references JBPM_TASKINSTANCE (ID_);
alter table JBPM_TOKEN add index FK_TOKEN_PARENT (PARENT_), add constraint FK_TOKEN_PARENT foreign key (PARENT_) references JBPM_TOKEN (ID_);
alter table JBPM_TOKEN add index FK_TOKEN_NODE (NODE_), add constraint FK_TOKEN_NODE foreign key (NODE_) references JBPM_NODE (ID_);
alter table JBPM_TOKEN add index FK_TOKEN_PROCINST (PROCESSINSTANCE_), add constraint FK_TOKEN_PROCINST foreign key (PROCESSINSTANCE_) references JBPM_PROCESSINSTANCE (ID_);
alter table JBPM_TOKEN add index FK_TOKEN_SUBPI (SUBPROCESSINSTANCE_), add constraint FK_TOKEN_SUBPI foreign key (SUBPROCESSINSTANCE_) references JBPM_PROCESSINSTANCE (ID_);
alter table JBPM_TOKENVARIABLEMAP add index FK_TKVARMAP_CTXT (CONTEXTINSTANCE_), add constraint FK_TKVARMAP_CTXT foreign key (CONTEXTINSTANCE_) references JBPM_MODULEINSTANCE (ID_);
alter table JBPM_TOKENVARIABLEMAP add index FK_TKVARMAP_TOKEN (TOKEN_), add constraint FK_TKVARMAP_TOKEN foreign key (TOKEN_) references JBPM_TOKEN (ID_);
alter table JBPM_TRANSITION add index FK_TRANSITION_TO (TO_), add constraint FK_TRANSITION_TO foreign key (TO_) references JBPM_NODE (ID_);
alter table JBPM_TRANSITION add index FK_TRANS_PROCDEF (PROCESSDEFINITION_), add constraint FK_TRANS_PROCDEF foreign key (PROCESSDEFINITION_) references JBPM_PROCESSDEFINITION (ID_);
alter table JBPM_TRANSITION add index FK_TRANSITION_FROM (FROM_), add constraint FK_TRANSITION_FROM foreign key (FROM_) references JBPM_NODE (ID_);
alter table JBPM_VARIABLEACCESS add index FK_VARACC_TSKCTRL (TASKCONTROLLER_), add constraint FK_VARACC_TSKCTRL foreign key (TASKCONTROLLER_) references JBPM_TASKCONTROLLER (ID_);
alter table JBPM_VARIABLEACCESS add index FK_VARACC_SCRIPT (SCRIPT_), add constraint FK_VARACC_SCRIPT foreign key (SCRIPT_) references JBPM_ACTION (ID_);
alter table JBPM_VARIABLEACCESS add index FK_VARACC_PROCST (PROCESSSTATE_), add constraint FK_VARACC_PROCST foreign key (PROCESSSTATE_) references JBPM_NODE (ID_);
alter table JBPM_VARIABLEINSTANCE add index FK_VARINST_TK (TOKEN_), add constraint FK_VARINST_TK foreign key (TOKEN_) references JBPM_TOKEN (ID_);
alter table JBPM_VARIABLEINSTANCE add index FK_VARINST_TKVARMP (TOKENVARIABLEMAP_), add constraint FK_VARINST_TKVARMP foreign key (TOKENVARIABLEMAP_) references JBPM_TOKENVARIABLEMAP (ID_);
alter table JBPM_VARIABLEINSTANCE add index FK_VARINST_PRCINST (PROCESSINSTANCE_), add constraint FK_VARINST_PRCINST foreign key (PROCESSINSTANCE_) references JBPM_PROCESSINSTANCE (ID_);
alter table JBPM_VARIABLEINSTANCE add index FK_VAR_TSKINST (TASKINSTANCE_), add constraint FK_VAR_TSKINST foreign key (TASKINSTANCE_) references JBPM_TASKINSTANCE (ID_);
alter table JBPM_VARIABLEINSTANCE add index FK_BYTEINST_ARRAY (BYTEARRAYVALUE_), add constraint FK_BYTEINST_ARRAY foreign key (BYTEARRAYVALUE_) references JBPM_BYTEARRAY (ID_);
