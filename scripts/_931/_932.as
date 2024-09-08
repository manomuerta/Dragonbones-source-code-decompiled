package _931
{
   import _1045.Group;
   import _1185._1189;
   import _1185._1196;
   import _127._144;
   import _127._166;
   
   public class _932 extends _166
   {
      public static const dot:Class = _932_dot;
      
      private static const cross:Class = _932_cross;
      
      private static const lock:Class = _932_lock;
      
      private static const radio:Class = _932_radio;
      
      private static const _10817:Class = _932__10817;
      
      public var _4528:_144;
      
      public var _4510:_144;
      
      public var _6667:_144;
      
      private var _6671:Boolean = true;
      
      public function _932()
      {
         super();
      }
      
      public function get _6670() : Boolean
      {
         return this._6671;
      }
      
      public function set _6670(param1:Boolean) : void
      {
         this._6671 = param1;
         _2612();
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this._4528 = new _144();
         this._4510 = new _144();
         this._6667 = new _144();
         this._4528.alpha = 0.6;
         this._4528.width = 15;
         this._4528.height = 15;
         this._4528.visible = true;
         this._4528.selected = true;
         this._4510.alpha = 0.6;
         this._4510.width = 15;
         this._4510.height = 15;
         this._4510.visible = true;
         this._4510.selected = true;
         this._6667.alpha = 0.8;
         this._6667.width = 15;
         this._6667.height = 15;
         this._6667.visible = false;
         this._6667.selected = false;
         this._4528._2534 = cross;
         this._4528._2536 = dot;
         this._4528.buttonMode = true;
         this._4510._2534 = lock;
         this._4510._2536 = dot;
         this._4510.buttonMode = true;
         this._6667._2534 = radio;
         this._6667._2536 = _10817;
         this._6667.buttonMode = true;
         var _loc1_:_1189 = new _1189();
         _loc1_._2419 = 2;
         _loc1_.gap = 0;
         _loc1_.verticalAlign = _1196.MIDDLE;
         var _loc2_:Group = new Group();
         _loc2_.layout = _loc1_;
         _loc2_.top = 0;
         _loc2_.bottom = 0;
         var _loc3_:Group = new Group();
         _loc3_.top = 0;
         _loc3_.bottom = 0;
         _loc2_.addElement(this._4528);
         _loc2_.addElement(this._4510);
         _loc2_.addElement(_loc3_);
         _loc3_.addElement(this._6667);
         _loc3_.addElement(_2440);
         this.addElement(_loc2_);
      }
      
      override protected function _2519() : void
      {
         if(this._6670)
         {
            super._2519();
         }
      }
   }
}

