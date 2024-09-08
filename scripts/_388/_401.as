package _388
{
   import _1404._1407;
   import _555._570;
   import _579._580;
   import _721._763;
   import _93._92;
   
   public class _401 extends _92
   {
      public function _401()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override protected function _2211() : *
      {
         return {
            "width":this.canvas.width,
            "height":this.canvas.height,
            "color":this.canvas.bgColor
         };
      }
      
      override public function execute() : void
      {
         super.execute();
         this.canvas._3120(this._3124,this._3122,this.newColor);
         this._2894();
      }
      
      override public function revert() : void
      {
         super.revert();
         this.canvas._3120(this._3123,this._3121,this._3007);
         this._2894();
      }
      
      private function _2894() : void
      {
         this._3176._3345();
         this._2853.refresh();
      }
      
      private function get canvas() : _763
      {
         return _2223.canvas;
      }
      
      private function get _3124() : Number
      {
         return _2223.width;
      }
      
      private function get _3122() : Number
      {
         return _2223.height;
      }
      
      private function get newColor() : uint
      {
         return _2223.color;
      }
      
      private function get _3123() : Number
      {
         return _2208.width;
      }
      
      private function get _3121() : Number
      {
         return _2208.height;
      }
      
      private function get _3007() : uint
      {
         return _2208.color;
      }
      
      private function get _3176() : _580
      {
         return _1407.getInstance(_580) as _580;
      }
      
      private function get _2853() : _570
      {
         return _1407.getInstance(_570) as _570;
      }
   }
}

