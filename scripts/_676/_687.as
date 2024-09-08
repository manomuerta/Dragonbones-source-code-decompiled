package _676
{
   import _1038._1037;
   import _51._79;
   import _703._702;
   import _703._704;
   import _703._705;
   import _81._84;
   
   public class _687 extends _704
   {
      private var _5830:Array;
      
      private var _5829:_1037;
      
      public function _687()
      {
         super();
      }
      
      public static function _1572(param1:Array, param2:_702 = null) : _687
      {
         var _loc3_:_687 = new _687();
         _loc3_.parent = param2;
         _loc3_._1830 = param1;
         return _loc3_;
      }
      
      public function init() : void
      {
         var _loc1_:_79 = null;
         for each(_loc1_ in this._5830)
         {
            _705._2997[_loc1_] = _700._5828(this,_loc1_);
            _5822.push(_705._2997[_loc1_]);
         }
         _5822.reverse();
      }
      
      public function addSlot(param1:_79) : void
      {
         var _loc2_:_700 = _700._5828(this,param1);
         _705._2997[param1] = _loc2_;
         _5822.splice(_5822.length - param1.zOrder,0,_loc2_);
      }
      
      public function _2932(param1:_79) : void
      {
         var _loc2_:_700 = _705._2997[param1] as _700;
         _loc2_.parent = null;
         _705._2997[param1] = null;
         _84._1958(_loc2_,_5822);
      }
      
      public function _3017(param1:_79, param2:int) : void
      {
         var _loc3_:_700 = _705._2997[param1];
         _5822.splice(_5822.indexOf(_loc3_),1);
         _5822.splice(param2,0,_loc3_);
      }
      
      public function get _1830() : Array
      {
         return this._5830;
      }
      
      public function set _1830(param1:Array) : void
      {
         this._5830 = param1;
         this.init();
      }
      
      override public function get name() : String
      {
         return "DrawOrder";
      }
   }
}

