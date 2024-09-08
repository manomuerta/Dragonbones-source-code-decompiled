package _273
{
   import _1404._1407;
   import _18.IAction;
   import _555._556;
   import _586._605;
   import _721._763;
   import _93._92;
   import _97._117;
   
   public class _293 extends _92
   {
      public function _293()
      {
         super();
         _2219 = true;
         _2215 = true;
         _2224 = true;
      }
      
      override public function merge(param1:IAction) : Boolean
      {
         var _loc2_:_293 = param1 as _293;
         if(_loc2_)
         {
            _2223.width = _loc2_._3124;
            _2223.height = _loc2_._3122;
            _2223.color = _loc2_.newColor;
            return true;
         }
         return false;
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
         var _loc1_:String = this.newColor.toString(16);
         while(_loc1_.length < 6)
         {
            _loc1_ = "0" + _loc1_;
         }
         _117._2375 = _loc1_;
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
         this._3056.refresh();
         this._3118._3119();
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
      
      protected function get _3118() : _605
      {
         return _1407.getInstance(_605) as _605;
      }
      
      private function get _3056() : _556
      {
         return _1407.getInstance(_556) as _556;
      }
   }
}

