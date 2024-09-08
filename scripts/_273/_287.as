package _273
{
   import _54._53;
   import _54._56;
   import _54._57;
   import _54._67;
   import _644._645;
   import _644._646;
   import _93._92;
   
   public class _287 extends _92
   {
      private var _3109:Array;
      
      public function _287()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function execute() : void
      {
         var _loc1_:_67 = null;
         var _loc2_:_67 = null;
         super.execute();
         this._3109 = [];
         for each(_loc1_ in this._2069.tweens)
         {
            if(_loc1_ != this._2071)
            {
               this._3109.push(_loc1_);
            }
         }
         for each(_loc2_ in this._3109)
         {
            this._2069._2075(_loc2_);
            this._3077._2075(_loc2_);
         }
      }
      
      override public function revert() : void
      {
         var _loc1_:_67 = null;
         for each(_loc1_ in this._3109)
         {
            this._2069.addTween(_loc1_);
            this._3077.addTween(_loc1_);
         }
      }
      
      private function get _2070() : _56
      {
         return _2223._2070 as _56;
      }
      
      public function get _2069() : _57
      {
         return _2223._2069 as _57;
      }
      
      public function get _2071() : _67
      {
         return _2223._2071 as _67;
      }
      
      public function get _3070() : _645
      {
         return _2223._3070 as _645;
      }
      
      public function get _3077() : _646
      {
         return _2223._3077 as _646;
      }
      
      private function get _1992() : _53
      {
         return _2223._1992 as _53;
      }
   }
}

