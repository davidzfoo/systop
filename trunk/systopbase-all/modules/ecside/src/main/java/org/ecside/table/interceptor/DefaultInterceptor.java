﻿/*
 * Copyright 2004 original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.ecside.table.interceptor;

import org.ecside.core.TableModel;
import org.ecside.core.bean.Column;
import org.ecside.core.bean.Export;
import org.ecside.core.bean.Row;
import org.ecside.core.bean.Table;

/**
 * @author Jeff Johnston
 */
public class DefaultInterceptor implements TableInterceptor, RowInterceptor, ColumnInterceptor, ExportInterceptor {
    public void addTableAttributes(TableModel tableModel, Table table) {
    }

    public void addRowAttributes(TableModel tableModel, Row row) {
    }

    public void modifyRowAttributes(TableModel model, Row row) {
    }

    public void addColumnAttributes(TableModel tableModel, Column column) {
    }

    public void modifyColumnAttributes(TableModel model, Column column) {
    }

    public void addExportAttributes(TableModel tableModel, Export export) {
    }
}