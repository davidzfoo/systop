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
package org.ecside.table.limit;

import java.util.Map;

import org.ecside.core.context.WebContext;

/**
 * @author Wei Zijun & Jeff Johnston
 */

@SuppressWarnings("unchecked")
public interface LimitFactory {
    public int getCurrentRowsDisplayed(int totalRows, int defaultRowsDisplayed);

    public int getPage();

    public Sort getSort();
    
    public boolean isExported();

    public FilterSet getFilterSet();

    public Map getSortedOrFilteredParameters(String parameter);
    
    public String getTableId();
    
    public WebContext getWebContext();
}