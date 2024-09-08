package _676
{
   import _51._50;
   import _51._52;
   import _51._70;
   import _51._78;
   import _51._79;
   import _703._702;
   import _703._704;
   import _703._705;
   
   public class _677 extends _704
   {
      private var _5826:_684;
      
      public var _1795:_698;
      
      private var _2716:Array;
      
      public function _677()
      {
         this._2716 = [];
         super();
      }
      
      public static function _1572(param1:_50, param2:_702 = null) : _677
      {
         var _loc3_:_677 = new _677();
         _705._2951[param1] = _loc3_;
         _loc3_.parent = param2;
         _loc3_._1886 = param1;
         return _loc3_;
      }
      
      public function init() : void
      {
         var _loc1_:_698 = null;
         var _loc2_:_78 = null;
         var _loc3_:_52 = null;
         var _loc4_:_79 = null;
         this._1795 = _698._3996(this,this._1886._1795);
         for each(_loc2_ in this._1886._1781)
         {
            _loc1_ = _698._3996(this,_loc2_);
            this._2716.push(_loc1_);
         }
         for each(_loc3_ in this._1886._1779)
         {
            this.addBone(_loc3_);
         }
         for each(_loc4_ in this._1886._1780)
         {
            this.addSlot(_loc4_);
         }
         this._5826 = _705._2944[this._1886._1779[0]];
         _5822 = [this._5826];
      }
      
      public function addBone(param1:_52) : void
      {
         var _loc2_:_702 = !!param1.parentBoneData ? _705._2944[param1.parentBoneData] : this;
         _705._2944[param1] = _684._3996(_loc2_,param1);
      }
      
      public function _2892(param1:_52) : void
      {
         (_705._2944[param1] as _684).parentBone = null;
         _705._2944[param1] = null;
      }
      
      public function addSlot(param1:_79) : void
      {
         _705._2273[param1] = _700._3996(_705._2944[param1.parentBoneData],param1);
      }
      
      public function _2932(param1:_79) : void
      {
         var _loc3_:_685 = null;
         var _loc2_:_700 = _705._2273[param1];
         for each(_loc3_ in _loc2_.children)
         {
            this._2927(_loc3_.displayVO);
         }
         (_705._2273[param1] as _700).parentBone = null;
         _705._2273[param1] = null;
      }
      
      public function _2901(param1:_79) : void
      {
         (_705._2273[param1] as _700)._5823();
      }
      
      public function _2906(param1:_70) : void
      {
         this._1795._5825(param1);
      }
      
      public function _2927(param1:_70) : void
      {
         this._1795._5824(param1);
      }
      
      public function get _1886() : _50
      {
         return _3670 as _50;
      }
      
      public function set _1886(param1:_50) : void
      {
         if(_3670 == param1)
         {
            return;
         }
         _3670 = param1;
         this.init();
      }
   }
}

