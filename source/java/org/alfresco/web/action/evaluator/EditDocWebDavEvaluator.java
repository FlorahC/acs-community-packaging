/*
 * Copyright (C) 2005 Alfresco, Inc.
 *
 * Licensed under the Mozilla Public License version 1.1 
 * with a permitted attribution clause. You may obtain a
 * copy of the License at
 *
 *   http://www.alfresco.org/legal/license.txt
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
 * either express or implied. See the License for the specific
 * language governing permissions and limitations under the
 * License.
 */
package org.alfresco.web.action.evaluator;

import javax.faces.context.FacesContext;

import org.alfresco.model.ContentModel;
import org.alfresco.web.action.ActionEvaluator;
import org.alfresco.web.app.Application;
import org.alfresco.web.bean.repository.Node;

/**
 * UI Action Evaluator - Edit document via Webdav.
 * 
 * @author Kevin Roast
 */
public final class EditDocWebDavEvaluator implements ActionEvaluator
{
   /**
    * @see org.alfresco.web.action.ActionEvaluator#evaluate(org.alfresco.web.bean.repository.Node)
    */
   public boolean evaluate(Node node)
   {
      FacesContext fc = FacesContext.getCurrentInstance();
      
      // if the node is inline editable, the default http behaviour should always be used
      if (node.hasAspect(ContentModel.ASPECT_INLINEEDITABLE) == false &&
          "cifs".equals(Application.getClientConfig(fc).getEditLinkType()))
      {
         if (node.isWorkingCopyOwner() == true ||
             (node.isLocked() == false && node.hasAspect(ContentModel.ASPECT_WORKING_COPY) == false))
         {
            return true;
         }
      }
      
      return false;
   }
}
/*
<a:booleanEvaluator value="#{(r.locked == false && r.workingCopy == false) || r.owner == true}">
   <a:booleanEvaluator value="#{r.editLinkType == 'cifs'}">
*/