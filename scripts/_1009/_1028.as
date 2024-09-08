package _1009
{
   import _1038._1037;
   import _1045.Button;
   import _1045.DataGrid;
   import _1045.Group;
   import _1049._1053;
   import _1185._1189;
   import _127._171;
   import _625._626;
   import _648.PluginModel;
   import _890._902;
   import _97._125;
   import egret.utils._1547;
   import egret.utils.tr;
   import flash.display.Screen;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class _1028 extends _171
   {
      public var _5598:DataGrid;
      
      public var _5554:Button;
      
      public var _5555:Button;
      
      public var bound:Rectangle;
      
      public function _1028()
      {
         this._5598 = new DataGrid();
         this.bound = new Rectangle();
         super();
         this.width = this.minWidth = 575;
         this.height = this.minHeight = 280;
         title = tr("Plugin.SelectTitle");
      }
      
      override protected function _7290() : void
      {
         var _loc1_:Point = null;
         var _loc2_:Rectangle = null;
         var _loc3_:Point = null;
         var _loc4_:Screen = null;
         super._7290();
         if(!nativeWindow.closed)
         {
            _loc1_ = new Point();
            _loc1_.x = Math.round(this.bound.x + this.bound.width * 0.5 - nativeWindow.width * 0.5);
            _loc1_.y = Math.round(this.bound.y + this.bound.height * 0.5 - nativeWindow.height * 0.5);
            _loc2_ = new Rectangle(_loc1_.x,_loc1_.y,nativeWindow.width,nativeWindow.height);
            _loc3_ = new Point(_loc1_.x + nativeWindow.width / 2,_loc1_.y + nativeWindow.height / 2);
            _loc4_ = _1547._7289(_loc3_);
            if(!_loc4_)
            {
               _loc4_ = Screen.mainScreen;
            }
            _loc2_ = _1547._7288(_loc2_,new Rectangle(0,0,nativeWindow.width,nativeWindow.height),_loc4_);
            _loc1_.x = _loc2_.x;
            _loc1_.y = _loc2_.y + 60;
            nativeWindow.x = _loc1_.x;
            nativeWindow.y = _loc1_.y;
         }
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._5598.percentHeight = 100;
         this._5598.percentWidth = 100;
         this._5598.selectionIndicator = _626;
         this._5598.doubleClickEnabled = true;
         var _loc1_:_1037 = new _1037();
         var _loc2_:_1053 = new _1053();
         _loc2_.width = 300;
         _loc2_.resizable = false;
         _loc2_._6575 = "ooo";
         _loc2_.itemRenderer = _902;
         _loc2_._6572 = tr("Plugin.choose");
         _loc1_.addItem(_loc2_);
         _loc2_ = new _1053();
         _loc2_.resizable = false;
         _loc2_._6575 = "version";
         _loc2_._6146 = this._7281;
         _loc2_._6572 = tr("Plugin.version");
         _loc1_.addItem(_loc2_);
         _loc2_ = new _1053();
         _loc2_.resizable = false;
         _loc2_._6575 = "author";
         _loc2_._6146 = this._7282;
         _loc2_._6572 = tr("Plugin.author");
         _loc1_.addItem(_loc2_);
         this._5598.columns = _loc1_;
         var _loc3_:Group = this._2414();
         _loc3_.right = 6;
         _loc3_.percentHeight = 100;
         _2512.addElement(_loc3_);
         _loc3_.addElement(this._5598);
         this._5554 = _125._2399();
         _2632.addElement(this._5554);
         this._5555 = _125._2406();
         _2632.addElement(this._5555);
         _2512.addElement(_2632);
      }
      
      override protected function _2501() : void
      {
         this._5555.addEventListener(MouseEvent.CLICK,_2517);
      }
      
      private function _7281(param1:Object, param2:_1053 = null) : String
      {
         return param1["version"];
      }
      
      private function _7282(param1:Object, param2:_1053 = null) : String
      {
         return param1["author"];
      }
      
      public function _5572(param1:Array) : void
      {
         var _loc3_:PluginModel = null;
         var _loc4_:Object = null;
         var _loc5_:Object = null;
         var _loc2_:_1037 = new _1037();
         for each(_loc3_ in param1)
         {
            _loc4_ = new Object();
            (_loc5_ = new Object()).name = _loc3_.name;
            _loc4_.ooo = _loc3_;
            _loc4_.icon = _loc3_.icon;
            _loc4_.name = _loc3_.name;
            _loc4_.type = _loc3_.type;
            _loc4_.version = _loc3_.version;
            _loc4_.author = _loc3_.author;
            _loc4_.operation = _loc3_;
            _loc2_.addItem(_loc4_);
         }
         this._5598.dataProvider = _loc2_;
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

