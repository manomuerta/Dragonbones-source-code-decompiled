package _1009
{
   import _1038._1037;
   import _1045.Button;
   import _1045.DataGrid;
   import _1045.Group;
   import _1045.Label;
   import _1049._1053;
   import _1049._1063;
   import _1177.GridSelectionEvent;
   import _1185._1189;
   import _127._171;
   import _1374.IconButton;
   import _625._626;
   import _648.PluginModel;
   import _890._891;
   import _890._893;
   import _890._895;
   import _890._897;
   import _890._901;
   import _97._125;
   import egret.utils.tr;
   import flash.events.MouseEvent;
   import flash.text.TextFormatAlign;
   
   public class _1027 extends _171
   {
      public var _5598:DataGrid;
      
      public var _7284:_1053;
      
      public var _7285:_1053;
      
      public var _7286:_1053;
      
      public var _7287:_1053;
      
      private var _7278:Label;
      
      public var _4020:IconButton;
      
      public var _4203:IconButton;
      
      public var _4019:IconButton;
      
      public var _7283:Button;
      
      public function _1027()
      {
         this._5598 = new DataGrid();
         this._7284 = new _1053();
         this._7285 = new _1053();
         this._7286 = new _1053();
         this._7287 = new _1053();
         this._4020 = new IconButton();
         this._4203 = new IconButton();
         this._4019 = new IconButton();
         this._7283 = _125._2399();
         super();
         this.width = this.minWidth = 800;
         this.height = this.minHeight = 470;
         title = tr("Plugin.Title");
      }
      
      override protected function _2438() : void
      {
         super._2438();
         closeButton.visible = false;
         this._7278 = _125._2407();
         this._7278.top = 0;
         this._7278.left = 0;
         this._7278.size = 12;
         this._7278.leading = 0;
         this._7278.textAlign = TextFormatAlign.LEFT;
         this._7278.mouseEnabled = false;
         this._7278.mouseChildren = false;
         this._7278.text = "";
         _2512.percentWidth = 100;
         _2512.percentHeight = 100;
         var _loc1_:Group = new Group();
         _loc1_.left = 6;
         _loc1_.percentWidth = 100;
         _loc1_.addElement(this._7278);
         _2512.addElement(_loc1_);
         this._4020.icon = "/assets/button/addAnimation.png";
         this._4019.icon = "/assets/button/delAnimation.png";
         this._4203.icon = "/assets/button/folderOpen.png";
         this._4020.toolTip = tr("Plugin.add.tooltip");
         this._4019.toolTip = tr("Plugin.delete.tooltip");
         this._4203.toolTip = tr("Plugin.open.tooltip");
         this._4020.right = 36;
         this._4019.right = 6;
         this._4203.right = 66;
         _loc1_.addElement(this._4020);
         _loc1_.addElement(this._4019);
         _loc1_.addElement(this._4203);
         var _loc2_:Group = this._2414();
         _loc2_.right = 6;
         _loc2_.percentHeight = 100;
         _2512.addElement(_loc2_);
         this._5598.percentHeight = 100;
         this._5598.percentWidth = 100;
         this._5598.rowHeight = 50;
         this._5598.itemRenderer = _891;
         this._5598._7279 = Group;
         this._5598._6609 = _1063._6608;
         this._5598.selectionIndicator = _626;
         var _loc3_:_1037 = new _1037();
         this._7284.resizable = false;
         this._7284.width = 480;
         this._7284._6575 = "ooo";
         this._7284.itemRenderer = _897;
         this._7284._6572 = tr("Plugin.choose");
         _loc3_.addItem(this._7284);
         this._7285.width = 90;
         this._7285.resizable = false;
         this._7285._6575 = "version";
         this._7285.itemRenderer = _901;
         this._7285._6572 = tr("Plugin.version");
         _loc3_.addItem(this._7285);
         this._7286.width = 90;
         this._7286.resizable = false;
         this._7286._6575 = "author";
         this._7286.itemRenderer = _893;
         this._7286._6572 = tr("Plugin.author");
         _loc3_.addItem(this._7286);
         this._7287.width = 90;
         this._7287.resizable = false;
         this._7287._6575 = "operation";
         this._7287.itemRenderer = _895;
         this._7287._6572 = tr("Plugin.operation");
         _loc3_.addItem(this._7287);
         this._5598.columns = _loc3_;
         _loc2_.addElement(this._5598);
         var _loc4_:Group;
         (_loc4_ = new Group()).percentWidth = 100;
         this._7283.horizontalCenter = 0;
         _loc4_.addElement(this._7283);
         _2512.addElement(_loc4_);
         this._7283.addEventListener(MouseEvent.CLICK,_2517);
         this._5598.addEventListener(GridSelectionEvent.SELECTION_CHANGE,this._6509);
      }
      
      override protected function _5823(param1:Number, param2:Number) : void
      {
         super._5823(param1,param2);
         this._7280();
      }
      
      private function _7280() : void
      {
      }
      
      public function _5597(param1:int) : void
      {
         this._7278.text = tr("Plugin.pluginNumber",param1);
      }
      
      public function _5572(param1:Array, param2:String = "") : void
      {
         var _loc4_:PluginModel = null;
         var _loc5_:Object = null;
         var _loc6_:Object = null;
         var _loc7_:Object = null;
         var _loc3_:_1037 = new _1037();
         for each(_loc4_ in param1)
         {
            _loc5_ = new Object();
            (_loc6_ = new Object()).name = _loc4_.name;
            _loc5_.ooo = _loc4_;
            _loc5_.icon = _loc4_.icon;
            _loc5_.name = _loc4_.name;
            _loc5_.type = _loc4_.type;
            _loc5_.version = _loc4_.version;
            _loc5_.author = _loc4_.author;
            _loc5_.operation = _loc4_;
            _loc5_.description = _loc4_.description;
            _loc3_.addItem(_loc5_);
         }
         this._5598.dataProvider = _loc3_;
         if(param2 != "")
         {
            for each(_loc7_ in _loc3_)
            {
               if(_loc7_.name == param2)
               {
                  this._5598._2484 = _loc7_;
               }
            }
         }
         else
         {
            this._5598._2484 = null;
         }
         this._6509(null);
      }
      
      private function _6509(param1:GridSelectionEvent) : void
      {
         if(this._5598._2484)
         {
            this._4019.enabled = true;
         }
         else
         {
            this._4019.enabled = false;
         }
      }
      
      private function _2414() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         var _loc2_:_1189 = new _1189();
         _loc1_.layout = _loc2_;
         return _loc1_;
      }
   }
}

