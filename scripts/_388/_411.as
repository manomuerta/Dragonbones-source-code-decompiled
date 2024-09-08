package _388
{
   import _1404._1407;
   import _521.DBAnimateManager;
   import _579._580;
   import _586._588;
   import _93._92;
   import flash.geom.Point;
   
   public class _411 extends _92
   {
      public function _411()
      {
         super();
         _2219 = true;
         _2215 = false;
      }
      
      override public function execute() : void
      {
         super.execute();
         this._3388(this._3390);
      }
      
      override public function revert() : void
      {
         super.revert();
         this._3388(this._3391);
      }
      
      override protected function _2211() : *
      {
         return _2212._2580;
      }
      
      protected function _3388(param1:Number) : void
      {
         DBAnimateManager.getInstance()._3385(DBAnimateManager.ZOOMSTAGE,150,this._3391);
         DBAnimateManager.getInstance()._3382("scaleX",this.scaleX,param1);
         DBAnimateManager.getInstance()._3381("x",this._3389.x,this._2180.x);
         DBAnimateManager.getInstance()._3380("y",this._3389.y,this._2180.y);
         DBAnimateManager.getInstance().play([this]);
      }
      
      public function set x(param1:Number) : void
      {
         _2212._3384(param1);
      }
      
      public function set y(param1:Number) : void
      {
         _2212._3383(param1);
      }
      
      protected function get _3390() : Number
      {
         return _2223.zoom;
      }
      
      protected function get _3391() : Number
      {
         return _2208;
      }
      
      protected function get _2549() : Point
      {
         return _2223._2549;
      }
      
      public function get _3389() : Point
      {
         return _2212._3378();
      }
      
      public function get _2180() : Point
      {
         return _2212._3379(this._3390,this._2549);
      }
      
      public function set scaleX(param1:Number) : void
      {
         this._3176._3386(param1);
         _2212._10459(param1);
         this._2877._10459(param1);
      }
      
      public function get scaleX() : Number
      {
         return _2212._2580;
      }
      
      private function get _3176() : _580
      {
         return _1407.getInstance(_580) as _580;
      }
      
      private function get _2877() : _588
      {
         return _1407.getInstance(_588) as _588;
      }
   }
}

