package _273
{
   import _1404._1407;
   import _472._473;
   import _51._50;
   import _51._52;
   import _51._69;
   import _51._70;
   import _51._78;
   import _51._79;
   import _521._523;
   import _54._53;
   import _54._56;
   import _54._57;
   import _54._67;
   import _586._605;
   import _644._645;
   import _644._646;
   import _93._92;
   
   public class _285 extends _92
   {
      private var _3108:Vector.<_92>;
      
      public function _285()
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
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:Object = null;
         var _loc12_:_288 = null;
         super._1572(param1);
         this._3108 = new Vector.<_92>();
         var _loc7_:int = 0;
         var _loc8_:int = int(this._3070.tracks.length);
         while(_loc7_ < _loc8_)
         {
            _loc2_ = this._3070.tracks[_loc7_];
            _loc9_ = 0;
            _loc10_ = int(_loc2_.tweens.length);
            while(_loc9_ < _loc10_)
            {
               _loc3_ = _loc2_.tweens[_loc9_];
               _loc4_ = _loc3_.parent;
               _loc6_ = (_loc5_ = _loc4_.parent).parent;
               (_loc11_ = {})._1992 = _loc6_;
               _loc11_._2070 = _loc5_;
               _loc11_._2069 = _loc4_;
               _loc11_._2071 = _loc3_;
               _loc11_._3070 = this._3070;
               _loc11_._3077 = _loc2_;
               _loc12_ = new _288();
               _loc12_._1572(_loc11_);
               this._3108.push(_loc12_);
               _loc9_++;
            }
            _loc7_++;
         }
         _loc2_ = this._3070._3107;
         if(_loc2_)
         {
            _loc3_ = _loc2_._3106;
            _loc4_ = _loc3_._2069;
            _loc6_ = (_loc5_ = _loc4_._2070)._1992;
            (_loc11_ = {})._1992 = _loc6_;
            _loc11_._2070 = _loc5_;
            _loc11_._2069 = _loc4_;
            _loc11_._2071 = _loc3_;
            _loc11_._3070 = this._3070;
            _loc11_._3077 = _loc2_;
            _loc12_ = new _288();
            _loc12_._1572(_loc11_);
            this._3108.push(_loc12_);
         }
         _loc2_ = this._3070._10287;
         if(_loc2_)
         {
            _loc3_ = _loc2_._10288;
            _loc4_ = _loc3_._2069;
            _loc6_ = (_loc5_ = _loc4_._2070)._1992;
            (_loc11_ = {})._1992 = _loc6_;
            _loc11_._2070 = _loc5_;
            _loc11_._2069 = _loc4_;
            _loc11_._2071 = _loc3_;
            _loc11_._3070 = this._3070;
            _loc11_._3077 = _loc2_;
            _loc12_ = new _288();
            _loc12_._1572(_loc11_);
            this._3108.push(_loc12_);
         }
      }
      
      override protected function _2211() : *
      {
         var _loc3_:_78 = null;
         var _loc1_:_79 = _2223._1837 as _79;
         var _loc2_:Object = {};
         _loc2_.parentBone = _loc1_.parentBoneData;
         _loc2_.zOrder = _loc1_.zOrder;
         _loc2_._1711 = _loc1_._1711;
         _loc2_._1995 = _loc1_._1995;
         if(_loc2_._1995)
         {
            _loc2_.skinDisplayDic = {};
            for each(_loc3_ in this._1886._1781)
            {
               _loc2_.skinDisplayDic[_loc3_.name] = this._2915(_loc3_);
            }
         }
         else
         {
            _loc2_.skinDisplayDic = this._2915(this._1886._1795);
         }
         return _loc2_;
      }
      
      private function _2915(param1:_78) : Array
      {
         var _loc4_:_70 = null;
         var _loc2_:Array = [];
         var _loc3_:_79 = _2223._1837 as _79;
         for each(_loc4_ in param1._1765[_loc3_])
         {
            _loc2_.push([_loc4_,_loc4_._1733]);
         }
         return _loc2_;
      }
      
      override public function execute() : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         super.execute();
         if(this._3108)
         {
            _loc2_ = 0;
            _loc3_ = int(this._3108.length);
            while(_loc2_ < _loc3_)
            {
               this._3108[_loc2_].execute();
               _loc2_++;
            }
         }
         var _loc1_:_79 = _2223._1837 as _79;
         if(_2223._1836)
         {
            this._1886._1978(_loc1_);
            this._1886._1983(this._1836);
         }
         this._2894();
         if(this._2226._3054 == _loc1_)
         {
            this._2226._3053 = null;
         }
         if(this._2226._3050.indexOf(_loc1_) != -1)
         {
            this._2226._2986(null);
         }
      }
      
      override public function revert() : void
      {
         var _loc2_:int = 0;
         var _loc3_:Array = null;
         var _loc4_:Array = null;
         var _loc5_:String = null;
         super.revert();
         if(this._3108)
         {
            _loc2_ = int(this._3108.length - 1);
            while(_loc2_ >= 0)
            {
               this._3108[_loc2_].revert();
               _loc2_--;
            }
         }
         var _loc1_:_79 = _2223._1837 as _79;
         if(_2223._1836)
         {
            this._1836.parentBoneData = this._3052;
            this._1886._1794(this._1836);
            this._1836._1751();
            _loc1_.parentBoneData = this._1836;
            if(isNaN(this.zOrder))
            {
               this._1886._1792(_loc1_);
            }
            else
            {
               this._1886._1986(_loc1_,this.zOrder);
            }
            if(this._2931)
            {
               for(_loc5_ in this._2929)
               {
                  this._2918(this._2929[_loc5_],_loc5_);
               }
            }
            else
            {
               this._2918(this._2929 as Array,"");
            }
            _loc1_._1711 = this._2928;
         }
         this._2894();
         this._2226._2986(null,_loc1_);
      }
      
      private function _2918(param1:Array, param2:String) : void
      {
         var _loc4_:Array = null;
         var _loc5_:_70 = null;
         var _loc6_:_79 = null;
         var _loc7_:_69 = null;
         var _loc8_:String = null;
         var _loc3_:_79 = _2223._1837 as _79;
         for each(_loc4_ in param1)
         {
            _loc5_ = _loc4_[0];
            _loc6_ = _loc3_;
            _loc7_ = _loc4_[1];
            _loc8_ = param2;
            this._1886._1766(_loc5_,_loc6_,_loc7_,_loc8_);
         }
      }
      
      public function _2894() : void
      {
         this._3049._3051();
         this._3055._3105();
         this._3055._3062();
      }
      
      protected function get _1886() : _50
      {
         return this._3052.rootArmatureData as _50;
      }
      
      protected function get zOrder() : Number
      {
         return _2223.zOrder;
      }
      
      private function get _1836() : _52
      {
         return _2223._1836 as _52;
      }
      
      protected function get _3052() : _52
      {
         return _2223._3052 as _52;
      }
      
      protected function get _3070() : _645
      {
         return _2223._3070 as _645;
      }
      
      protected function get _2930() : _52
      {
         return _2208.parentBone;
      }
      
      protected function get _2933() : Number
      {
         return _2208.zOrder;
      }
      
      protected function get _2928() : _69
      {
         return _2208._1711;
      }
      
      protected function get _2931() : Boolean
      {
         return _2208._1995;
      }
      
      protected function get _2929() : Object
      {
         return _2208.skinDisplayDic;
      }
      
      protected function get _3049() : _605
      {
         return _1407.getInstance(_605) as _605;
      }
      
      protected function get _2226() : _523
      {
         return _1407.getInstance(_523);
      }
      
      public function get _3055() : _473
      {
         return _1407.getInstance(_473) as _473;
      }
   }
}

