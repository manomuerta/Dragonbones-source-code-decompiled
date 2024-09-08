package _273
{
   import _1404._1407;
   import _472._473;
   import _521._523;
   import _54._53;
   import _54._56;
   import _54._57;
   import _54._67;
   import _586._589;
   import _586._605;
   import _644._645;
   import _644._646;
   import _93._92;
   
   public class _289 extends _92
   {
      private var _3108:Vector.<_92>;
      
      public function _289()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function _1572(param1:*) : void
      {
         var _loc2_:_646 = null;
         var _loc3_:_67 = null;
         var _loc4_:_57 = null;
         var _loc5_:_56 = null;
         var _loc6_:_53 = null;
         var _loc10_:Object = null;
         var _loc11_:_288 = null;
         super._1572(param1);
         this._3108 = new Vector.<_92>();
         var _loc7_:Vector.<_67> = this._3110;
         var _loc8_:int = 0;
         var _loc9_:int = int(_loc7_.length);
         while(_loc8_ < _loc9_)
         {
            _loc3_ = _loc7_[_loc8_];
            _loc6_ = _loc3_._1992;
            _loc4_ = _loc3_._2069;
            _loc5_ = _loc3_._2070;
            _loc2_ = this._3058._3098(_loc3_);
            (_loc10_ = {})._1992 = _loc6_;
            _loc10_._2070 = _loc5_;
            _loc10_._2069 = _loc4_;
            _loc10_._2071 = _loc3_;
            _loc10_._3070 = this._3070;
            _loc10_._3077 = _loc2_;
            _loc11_ = new _288();
            _loc11_._1572(_loc10_);
            this._3108.push(_loc11_);
            _loc8_++;
         }
      }
      
      override public function execute() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         super.execute();
         if(this._3108)
         {
            _loc1_ = 0;
            _loc2_ = int(this._3108.length);
            while(_loc1_ < _loc2_)
            {
               this._3108[_loc1_].execute();
               _loc1_++;
            }
         }
         this._2894();
      }
      
      override public function revert() : void
      {
         var _loc1_:int = 0;
         super.revert();
         if(this._3108)
         {
            _loc1_ = int(this._3108.length - 1);
            while(_loc1_ >= 0)
            {
               this._3108[_loc1_].revert();
               _loc1_--;
            }
         }
         this._2894();
      }
      
      public function _2894() : void
      {
         this._3059._3051();
         this._3058._3065();
         this._3059._3060();
         this._3073._3105();
         this._2226._3053 = null;
         this._2226._2986(null);
      }
      
      private function get _3110() : Vector.<_67>
      {
         return _2223._3110 as Vector.<_67>;
      }
      
      protected function get _3070() : _645
      {
         return _2223._3070 as _645;
      }
      
      protected function get _3059() : _605
      {
         return _1407.getInstance(_605) as _605;
      }
      
      protected function get _3058() : _589
      {
         return _1407.getInstance(_589) as _589;
      }
      
      protected function get _2226() : _523
      {
         return _1407.getInstance(_523);
      }
      
      public function get _3073() : _473
      {
         return _1407.getInstance(_473) as _473;
      }
   }
}

