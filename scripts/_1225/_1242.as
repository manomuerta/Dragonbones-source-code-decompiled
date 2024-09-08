package _1225
{
   import _1045.Scroller;
   import _1045._1046;
   import _1088.ItemRenderer;
   import _1185._1188;
   import _1185._1197;
   import _1278._1277;
   import egret.core.ns_egret;
   import flash.display.GradientType;
   
   use namespace ns_egret;
   
   public class _1242 extends _1277
   {
      public var _2490:_1046;
      
      public var _2491:Scroller;
      
      public function _1242()
      {
         super();
         minWidth = 70;
         minHeight = 70;
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._2490 = new _1046();
         this._2490.itemRenderer = ItemRenderer;
         var _loc1_:_1197 = new _1197();
         _loc1_.gap = 0;
         _loc1_._2401 = _1188.CONTENT_JUSTIFY;
         this._2490.layout = _loc1_;
         this._2491 = new Scroller();
         this._2491.left = 0;
         this._2491.top = 0;
         this._2491.right = 0;
         this._2491.bottom = 0;
         this._2491._6243 = 1;
         this._2491.viewport = this._2490;
         this._2491.skinName = _1257;
         addElement(this._2491);
      }
      
      override public function _5823(param1:Number, param2:Number) : void
      {
         super._5823(param1,param2);
         graphics.clear();
         drawRoundRect(0,0,param1,param2,0,ns_egret::_9052[0],1,_9056(0,0,param1,param2),GradientType.LINEAR,null,{
            "x":1,
            "y":1,
            "w":param1 - 2,
            "h":param2 - 2,
            "r":0
         });
      }
   }
}

