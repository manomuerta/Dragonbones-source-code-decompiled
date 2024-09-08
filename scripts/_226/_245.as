package _226
{
   import _1404._1407;
   import _18.IAction;
   import _51._52;
   import _555._570;
   import _93._92;
   
   public class _245 extends _92
   {
      public function _245()
      {
         super();
         _2219 = true;
         _2215 = true;
         _2224 = true;
      }
      
      override public function execute() : void
      {
         super.execute();
         this._2961(this._2959);
         this._2894();
      }
      
      override public function revert() : void
      {
         super.revert();
         this._2961(this._2960);
         this._2894();
      }
      
      public function _2893() : void
      {
         this._2961(this._2959);
      }
      
      protected function _2894() : void
      {
         _2212._2939();
         _570(_1407.getInstance(_570)).refresh();
      }
      
      override public function merge(param1:IAction) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:_245 = param1 as _245;
         if(_loc2_)
         {
            _loc4_ = int(this._2959.length);
            _loc3_ = 0;
            while(_loc3_ < _loc4_)
            {
               this._2959[_loc3_] = _loc2_._2959[_loc3_];
               _loc3_++;
            }
            return true;
         }
         return false;
      }
      
      protected function _2961(param1:Array) : void
      {
         var _loc2_:_52 = null;
         var _loc3_:int = 0;
         var _loc4_:int = int(this._2957.length);
         while(_loc3_ < _loc4_)
         {
            _loc2_ = this._2957[_loc3_];
            _loc2_.length = param1[_loc3_];
            _2212._2881(_loc2_,false);
            _loc3_++;
         }
      }
      
      override protected function _2211() : *
      {
         var _loc2_:_52 = null;
         var _loc1_:Array = [];
         for each(_loc2_ in this._2957)
         {
            _loc1_.push(_loc2_.length);
         }
         return _loc1_;
      }
      
      protected function get _2957() : Array
      {
         return _2223.items;
      }
      
      protected function get _2959() : Array
      {
         return _2223._2953;
      }
      
      protected function get _2960() : Array
      {
         return _2208;
      }
   }
}

