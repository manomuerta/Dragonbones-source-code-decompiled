package _997
{
   import _1038._1043;
   import _1045.Button;
   import _1045.Group;
   import _1045.Menu;
   import _1185._1189;
   import _1374.IconButton;
   import _1404._1407;
   import _24._26;
   import _639.HotkeysModel;
   import _783.CommandNotification;
   import _822._13168;
   import _872._11512;
   import _97._125;
   import egret.core._1140;
   import egret.utils.tr;
   
   public class _998 extends Group
   {
      public var _3763:Array;
      
      public var _4952:_13168;
      
      public var _4951:_13168;
      
      public var _3749:_13168;
      
      public var _3764:_13168;
      
      public var _3765:_13168;
      
      public var _11144:_13168;
      
      public var _7000:_13168;
      
      public var _3756:_13168;
      
      public var _3760:_13168;
      
      public var _3754:_13168;
      
      public var _3761:Button;
      
      public var _11597:IconButton;
      
      public var _3759:Menu;
      
      public var _6999:_13168;
      
      public var _3758:_996;
      
      public var _3748:_13168;
      
      public var _2585:Group;
      
      public var elements:Vector.<_1140>;
      
      public function _998()
      {
         this._3763 = [];
         super();
         var _loc1_:_1189 = new _1189();
         _loc1_.gap = 2;
         _loc1_.verticalAlign = "middle";
         _loc1_._2401 = "left";
         this.layout = _loc1_;
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.left = 0;
         this.elements = new Vector.<_1140>();
      }
      
      private function _7001(param1:String, param2:String, param3:Object) : _13168
      {
         var _loc4_:_13168 = null;
         (_loc4_ = new _13168()).id = param1;
         _loc4_.toolTip = param2;
         _loc4_.icon = param3;
         _loc4_._2576 = false;
         this._3763.push(_loc4_);
         addElement(_loc4_);
         return _loc4_;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         var _loc1_:_996 = new _996();
         addElement(_loc1_);
         this.elements.push(_loc1_);
         var _loc2_:HotkeysModel = HotkeysModel.getInstance();
         this._4952 = this._7001(CommandNotification.SHOW_NEW_PROJECT_WINDOW,tr("NewProject.ToolTip",_loc2_._11726(_26.NEW_PROJECT)),"assets/menu/new.png");
         this._4951 = this._7001(CommandNotification.SHOW_OPEN_PROJECT_DIALOG,tr("OpenProject.ToolTip",_loc2_._11726(_26.OPEN_PROJECT)),"assets/menu/open.png");
         this._3749 = this._7001(CommandNotification.SAVE_PROJECT,tr("SaveProject.ToolTip",_loc2_._11726(_26.SAVE_PROJECT)),"assets/menu/save.png");
         this.elements.push(this._4952);
         this.elements.push(this._4951);
         this.elements.push(this._3749);
         _loc1_ = new _996();
         addElement(_loc1_);
         this.elements.push(_loc1_);
         this._3764 = this._7001(CommandNotification.UNDO,tr("Undo.ToolTip",_loc2_._11726(_26.UNDO)),"assets/menu/undo.png");
         this._3765 = this._7001(CommandNotification.REDO,tr("Redo.ToolTip",_loc2_._11726(_26.REDO)),"assets/menu/redo.png");
         this.elements.push(this._3764);
         this.elements.push(this._3765);
         _loc1_ = new _996();
         addElement(_loc1_);
         this.elements.push(_loc1_);
         this._11144 = this._7001(CommandNotification.IMPORT_ASSETS_TO_STAGE,tr("ImportAssets.ToolTip"),"assets/button/importImage.png");
         this._7000 = this._7001(CommandNotification.SHOW_IMPORT_WINDOW,tr("ImportProject.ToolTip"),"assets/menu/import.png");
         this._3756 = this._7001(CommandNotification.SHOW_EXPORT_WINDOW,tr("ExportProject.ToolTip",_loc2_._11726(_26.EXPORT)),"assets/menu/export.png");
         this.elements.push(this._11144);
         this.elements.push(this._7000);
         this.elements.push(this._3756);
         _loc1_ = new _996();
         addElement(_loc1_);
         this.elements.push(_loc1_);
         this._3754 = this._7001(CommandNotification.PREVIEW,tr("PreviewProject.PreviewTip",_loc2_._11726(_26.PREVIEW)),"assets/button/preview.png");
         this._3760 = this._7001(CommandNotification.SHOW_SHARE_WINDOW,tr("ShareProject.ToolTip"),"assets/button/share.png");
         this._6999 = this._7001(CommandNotification.OPEN_TRELLO,tr("Open.Trello"),"assets/button/trello.png");
         removeElement(this._3760);
         this.elements.push(this._3754);
         this.elements.push(this._6999);
         this._3761 = new Button();
         this._3761.label = tr("LoginWindow.Login");
         this._11597 = new IconButton();
         this._11597.icon = "assets/button/profile.png";
         this._11597.visible = false;
         this._11597.includeInLayout = false;
         this._2585 = _125._2398(20);
         this._2585.percentHeight = 100;
         this._2585.percentWidth = 100;
         var _loc3_:_11512 = _1407.getInstance(_11512) as _11512;
         if(_loc3_)
         {
            this._2585.addElement(_loc3_.button);
         }
         this._2585.addElement(this._11597);
         this._2585.addElement(this._3761);
         var _loc4_:Group;
         (_loc4_ = new Group()).width = 6;
         this._2585.addElement(_loc4_);
         var _loc5_:* = "<root>" + "<menuitem label=\"" + tr("LoginWindow.TitleChangePassword") + "\" id = \"changePassword\"/>" + "<menuitem label=\"" + tr("Setting.Logout") + "\" id = \"logout\"/>" + "</root>";
         var _loc6_:_1043;
         (_loc6_ = new _1043()).source = new XML(_loc5_);
         this._3759 = Menu._6375(this,_loc6_);
         this._3759._5987 = "@label";
         this._3759._6377 = "@icon";
         this._3758 = new _996();
         addElement(this._3758);
         this.elements.push(this._3758);
         this._3748 = this._7001(CommandNotification.IMPORT_COMIC_ASSETS,tr("LibraryPanel.import.tip"),"assets/button/importImage.png");
      }
      
      public function _11595(param1:String) : void
      {
         this._11597.visible = true;
         this._11597.includeInLayout = true;
         this._11597.toolTip = param1;
         this._3761.visible = false;
         this._3761.includeInLayout = false;
      }
      
      public function logout() : void
      {
         this._11597.visible = false;
         this._11597.includeInLayout = false;
         this._3761.visible = true;
         this._3761.includeInLayout = true;
      }
      
      public function _13273(param1:int) : void
      {
         var _loc5_:Boolean = false;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         _loc3_ = 0;
         _loc4_ = int(this.elements.length);
         while(_loc3_ < _loc4_)
         {
            if(_loc2_ < param1 && !_loc5_)
            {
               _loc2_ += this.elements[_loc3_].width + 2;
               if(_loc2_ < param1)
               {
                  if(this.elements[_loc3_].parent == null)
                  {
                     addElement(this.elements[_loc3_]);
                  }
               }
               else
               {
                  if(this.elements[_loc3_].parent != null)
                  {
                     removeElement(this.elements[_loc3_]);
                  }
                  _loc5_ = true;
               }
            }
            else if(this.elements[_loc3_].parent != null)
            {
               removeElement(this.elements[_loc3_]);
            }
            _loc3_++;
         }
      }
      
      public function showAll() : void
      {
         this._13273(99999);
      }
   }
}

