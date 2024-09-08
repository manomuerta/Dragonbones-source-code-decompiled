package _388
{
   import _93._92;
   import flash.geom.Point;
   
   public class _402 extends _92
   {
      public function _402()
      {
         super();
         _2219 = true;
         _2215 = false;
      }
      
      override public function execute() : void
      {
         super.execute();
         this._3347(this._1883);
      }
      
      override public function revert() : void
      {
         super.revert();
         this._3347(this.oldPosition);
      }
      
      override protected function _2211() : *
      {
         return _2212._2580;
      }
      
      protected function _3347(param1:Point) : void
      {
         this.position = param1;
      }
      
      public function set position(param1:Point) : void
      {
         _2212._3348(param1);
      }
      
      protected function get _1883() : Point
      {
         return _2223;
      }
      
      protected function get oldPosition() : Point
      {
         return _2208;
      }
   }
}

