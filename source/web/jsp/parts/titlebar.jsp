<%--
  Copyright (C) 2005 Alfresco, Inc.
 
  Licensed under the Mozilla Public License version 1.1 
  with a permitted attribution clause. You may obtain a
  copy of the License at
 
    http://www.alfresco.org/legal/license.txt
 
  Unless required by applicable law or agreed to in writing,
  software distributed under the License is distributed on an
  "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
  either express or implied. See the License for the specific
  language governing permissions and limitations under the
  License.
--%>
<%-- Title bar area --%>
<table cellspacing=0 cellpadding=2 width=100%>
   <tr>
      <%-- Top level toolbar and company logo area --%>
      <td width=100%>
         <table cellspacing=0 cellpadding=0 width=100%>
            <tr>
               <td style="padding-right:4px;"><a:actionLink image="/images/logo/AlfrescoLogo32.png" value="Alfresco" tooltip="Alfresco" showLink="false" action="about" /></td>
               <td><img src="<%=request.getContextPath()%>/images/parts/titlebar_begin.gif" width=10 height=30></td>
               <td width=100% style="background-image: url(<%=request.getContextPath()%>/images/parts/titlebar_bg.gif)">
                  <%-- Toolbar --%>
                  <a:modeList itemSpacing="3" iconColumnWidth="0" horizontal="true"
                        itemStyleClass="topToolbar" itemLinkStyleClass="topToolbarLink" selectedStyleClass="topToolbar" selectedLinkStyleClass="topToolbarLink"
                        value="#{NavigationBean.toolbarLocation}" actionListener="#{NavigationBean.toolbarLocationChanged}">
                     <a:listItem value="company" label="#{msg.company_home}" rendered="#{NavigationBean.companyHomeVisible}" />
                     <a:listItem value="home" label="#{msg.my_home}" />
                     <a:listItem value="guest" label="#{msg.guest_home}" rendered="#{NavigationBean.isGuest == false && NavigationBean.guestHomeVisible}" />
                     <a:listItem value="dashboard" label="#{msg.my_alfresco}" />
                  </a:modeList>
               </td>
               <td><img src="<%=request.getContextPath()%>/images/parts/titlebar_end.gif" width=8 height=30></td>
            </tr>
         </table>
      </td>
      
      <%-- Help area --%>
      <td>
         <table cellspacing=2 cellpadding=0 width=100%>
            <tr>
               <td>
                  <%-- admin user only actions --%>
                  <a:booleanEvaluator value="#{NavigationBean.currentUser.admin == true}" id="evalA">
                     <a:actionLink value="#{msg.admin_console}" image="/images/icons/admin_console.gif" showLink="false" action="dialog:adminConsole" id="link11_1" />
                  </a:booleanEvaluator>
               </td>
               <td width=8>&nbsp;</td>
               <td>
                  <%-- user preferences --%>
                  <a:actionLink value="#{msg.user_console}" image="/images/icons/user_console.gif" showLink="false" action="dialog:userConsole" actionListener="#{UsersBean.setupUserAction}" id="link11_2">
                     <f:param name="id" value="#{NavigationBean.currentUser.person.id}" />
                  </a:actionLink>
               </td>
               <td width=8>&nbsp;</td>
               <td><a:actionLink value="#{msg.toggle_shelf}" image="/images/icons/shelf.gif" showLink="false" actionListener="#{NavigationBean.toggleShelf}" /></td>
               <td width=8>&nbsp;</td>
               <td><a:actionLink value="#{msg.help}" image="/images/icons/Help_icon.gif" showLink="false" href="#{NavigationBean.helpUrl}" target="help" /></td>
               <td width=8>&nbsp;</td>
               <td><nobr><a href="http://www.alfresco.com/services/support/issues/" target="new"><h:outputText value="#{msg.raise_issue}" /></a></nobr></td>
               <td width=8>&nbsp;</td>
               <td><nobr>
                  <a:actionLink id="logout" image="/images/icons/logout.gif" value="#{msg.logout} (#{NavigationBean.currentUser.userName})" rendered="#{NavigationBean.isGuest == false}" action="#{LoginBean.logout}" />
                  <a:actionLink id="login" image="/images/icons/login.gif" value="#{msg.login} (#{NavigationBean.currentUser.userName})" rendered="#{NavigationBean.isGuest == true}" action="#{LoginBean.logout}" />
               </nobr></td>
            </tr>
         </table>
      </td>
      
      <%-- Search area --%>
      <td>
         <table cellspacing=0 cellpadding=0 width=100%>
            <tr>
               <td><img src="<%=request.getContextPath()%>/images/parts/searchbar_begin.gif" width=6 height=30></td>
               <td width=100% style="background-image: url(<%=request.getContextPath()%>/images/parts/searchbar_bg.gif)">
                  <r:simpleSearch id="search" actionListener="#{BrowseBean.search}" />
               </td>
               <td><img src="<%=request.getContextPath()%>/images/parts/searchbar_end.gif" width=6 height=30></td>
            </tr>
         </table>
      </td>
   </tr>
</table>
