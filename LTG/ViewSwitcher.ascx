<%@ Control Language="C#" AutoEventWireup="true" Codefile="ViewSwitcher.ascx.cs" Inherits="LTG.ViewSwitcher" %>
<div id="viewSwitcher">
    <%: CurrentView %> view | <a href="<%: SwitchUrl %>" data-ajax="false">Switch to <%: AlternateView %></a>
</div>
