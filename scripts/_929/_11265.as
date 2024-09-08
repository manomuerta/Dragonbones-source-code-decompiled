package _929
{
   import _1038._1037;
   import _1045.Group;
   import _1045.Menu;
   import _1177.MenuEvent;
   import _1374.IconButton;
   import _1439._1454;
   import _636.DBPanelEvent;
   import egret.utils.tr;
   import flash.events.MouseEvent;
   
   public class _11265 extends Group
   {
      public const ADD_BONE_TYPE:String = "bone";
      
      public const ADD_SLOT_TYPE:String = "slot";
      
      public const ADD_BOUNDINGBOX_TYPE:String = "boundingBox";
      
      public var _6318:IconButton;
      
      public var menu:Menu;
      
      private var _6320:_1037;
      
      public var addBone:Object;
      
      public var addSlot:Object;
      
      public var addBoundingBox:Object;
      
      public var _11354:Boolean;
      
      public var _11353:Boolean;
      
      public var _11344:Boolean;
      
      public function _11265()
      {
         this._6318 = new IconButton();
         this.menu = new Menu();
         super();
         this.addBone = {
            "type":this.ADD_BONE_TYPE,
            "icon":"/assets/button/addBone.png",
            "toolTip":tr("ScenePanel.newBoneBtn.tooltip"),
            "enabled":true
         };
         this.addSlot = {
            "type":this.ADD_SLOT_TYPE,
            "icon":"/assets/button/addSlot.png",
            "toolTip":tr("ScenePanel.newSlotBtn.tooltip"),
            "enabled":true
         };
         this.addBoundingBox = {
            "type":this.ADD_BOUNDINGBOX_TYPE,
            "icon":"/assets/button/addBoundingBox.png",
            "toolTip":tr("ScenePanel.newBBoxBtn.tooltip"),
            "enabled":true
         };
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._6318.icon = "/assets/button/addVO.png";
         this._6320 = new _1037();
         this._6320.addItem(this.addBone);
         this._6320.addItem(this.addSlot);
         this._6320.addItem(this.addBoundingBox);
         Menu._6319(this.menu,this,this._6320);
         this.menu.itemRenderer = _11266;
         this.menu._2514 = _1454;
         this.menu.visible = false;
         this.menu.tabEnabled = false;
         this.menu.width = 26;
         this.menu.addEventListener(MenuEvent.ITEM_CLICK,this._6315);
         this._6318.width = 22;
         this._6318.right = 1;
         this._6318.top = 1;
         this._6318.bottom = 1;
         this._6318.addEventListener(MouseEvent.MOUSE_DOWN,this._6311);
         this.addElement(this._6318);
      }
      
      private function _6311(param1:MouseEvent) : void
      {
         if(this.menu.visible)
         {
            this.menu.hide();
         }
         else if(this._6318.enabled)
         {
            this.menu.show(width - this.menu.width,height);
         }
         param1.stopImmediatePropagation();
      }
      
      private function _6315(param1:MenuEvent) : void
      {
         switch(param1.item.type)
         {
            case this.ADD_BONE_TYPE:
               dispatchEvent(new DBPanelEvent(DBPanelEvent.ADD_BONE));
               break;
            case this.ADD_SLOT_TYPE:
               dispatchEvent(new DBPanelEvent(DBPanelEvent.ADD_SLOT));
               break;
            case this.ADD_BOUNDINGBOX_TYPE:
               dispatchEvent(new DBPanelEvent(DBPanelEvent.ADD_BOUNDINGBOX));
         }
      }
      
      public function _4891() : void
      {
         this.addBone.enabled = this._11354;
         this.addSlot.enabled = this._11353;
         this.addBoundingBox.enabled = this._11344;
         if(this._6320)
         {
            this._6320.refresh();
         }
         if(!this._11354 && !this._11353 && !this._11344)
         {
            this._6318.enabled = false;
         }
         else
         {
            this._6318.enabled = true;
         }
      }
   }
}

