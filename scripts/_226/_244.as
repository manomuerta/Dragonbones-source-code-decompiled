package _226
{
   import _1404._1407;
   import _51._52;
   import _555._570;
   import _93._92;
   
   public class _244 extends _92
   {
      public function _244()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function execute() : void
      {
         super.execute();
         this._2955(this._2958);
         this._2894();
      }
      
      override public function revert() : void
      {
         super.revert();
         this._2955(this._2956);
         this._2894();
      }
      
      public function _2893() : void
      {
         this._2955(this._2958);
      }
      
      protected function _2894() : void
      {
         _570(_1407.getInstance(_570)).refresh();
      }
      
      protected function _2955(param1:Array) : void
      {
         var _loc2_:_52 = null;
         var _loc3_:int = 0;
         var _loc4_:int = int(this._2957.length);
         while(_loc3_ < _loc4_)
         {
            _loc2_ = this._2957[_loc3_];
            if(param1[_loc3_])
            {
               _loc2_.color = param1[_loc3_];
            }
            else
            {
               _loc2_._2035();
            }
            _2212._2954(_loc2_);
            _loc3_++;
         }
      }
      
      override protected function _2211() : *
      {
         var _loc2_:_52 = null;
         var _loc1_:Array = [];
         for each(_loc2_ in this._2957)
         {
            if(_loc2_._2028)
            {
               _loc1_.push(_loc2_.color);
            }
            else
            {
               _loc1_.push(false);
            }
         }
         return _loc1_;
      }
      
      protected function get _2957() : Array
      {
         return _2223.items;
      }
      
      protected function get _2958() : Array
      {
         return _2223._2953;
      }
      
      protected function get _2956() : Array
      {
         return _2208;
      }
   }
}

