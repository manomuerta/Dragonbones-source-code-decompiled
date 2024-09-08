package _425
{
   import _13492._13495;
   import _13492._13496;
   import _13505._13504;
   import _13505._13508;
   import _13505._13510;
   import _13515._13521;
   import _13515._13532;
   import _1404._1407;
   import _226._232;
   import _226._237;
   import _470._469;
   import _51._52;
   import _51._69;
   import _51._70;
   import _51._79;
   import _555._570;
   import _555._576;
   import _573.TimelinePanelController;
   import _93._92;
   
   public class _432 extends _92
   {
      private var _3108:Vector.<_92>;
      
      public function _432()
      {
         super();
         _2219 = true;
         _2215 = true;
      }
      
      override public function execute() : void
      {
         _2208 = [];
         this._3108 = new Vector.<_92>();
         this._3421();
         this._2894();
      }
      
      private function _3421() : void
      {
         var _loc1_:_52 = null;
         var _loc2_:_79 = null;
         var _loc3_:_52 = null;
         var _loc4_:_79 = null;
         var _loc5_:_70 = null;
         var _loc6_:String = null;
         var _loc7_:_69 = null;
         var _loc8_:_13495 = null;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:_232 = null;
         if(this._3419 == null || this._3420 == null)
         {
            return;
         }
         _loc4_ = this._3419._1824;
         this._3418(this._13756,this._3420._13581);
         this._3418(this._13759,this._3420._13586);
         this._3418(this._13760,this._3420._13598);
         _loc6_ = _2223._2898;
         if(this._3422)
         {
            _loc9_ = 0;
            _loc10_ = int(this._3422.length);
            while(_loc9_ < _loc10_)
            {
               _loc5_ = this._3422[_loc9_] as _70;
               if(_loc5_)
               {
                  _loc7_ = _2223._3014[_loc5_];
                  _loc11_ = new _232();
                  _loc11_._1572(_469._2895(_loc5_,_loc6_,_loc4_,_loc7_,false));
                  _loc11_._2893();
                  _2223._3014[_loc5_] = _loc5_._1733;
               }
               _loc9_++;
            }
         }
         if(this._13758)
         {
            _loc9_ = 0;
            _loc10_ = int(this._13758.length);
            while(_loc9_ < _loc10_)
            {
               _loc8_ = this._13758[_loc9_];
               _loc5_ = this._2978[_loc9_];
               if(_loc5_)
               {
                  _loc8_.value = _loc5_._1733;
               }
               _loc9_++;
            }
         }
         this._3418(this._13761,this._3419._13599);
         this._3418(this._13758,this._3419._13572);
         this._3418(this._13757,this._3419._13592);
      }
      
      private function _3418(param1:Array, param2:_13510) : void
      {
         var _loc3_:_13496 = null;
         var _loc4_:int = 0;
         var _loc5_:int = int(param1.length);
         while(_loc4_ < _loc5_)
         {
            _loc3_ = param1[_loc4_] as _13496;
            this._3423(_loc3_,param2);
            _loc4_++;
         }
      }
      
      private function _3423(param1:_13496, param2:_13510) : void
      {
         var _loc4_:Object = null;
         var _loc5_:_13532 = null;
         var _loc6_:Object = null;
         var _loc7_:_13521 = null;
         var _loc3_:_13496 = param2.getFrameByIndex(param1.startPos);
         if(_loc3_)
         {
            (_loc4_ = {}).newValue = param1.value;
            _loc4_.oldValue = _loc3_.value;
            _loc4_._1946 = _loc3_;
            _loc5_ = new _13532();
            _loc5_._1572(_loc4_);
            _loc5_.execute();
            this._3108.push(_loc5_);
            param2._1942();
         }
         else
         {
            (_loc6_ = {})._1946 = param1;
            _loc6_._1945 = param2;
            _loc7_ = new _13521();
            _loc7_._1572(_loc6_);
            _loc7_.execute();
            this._3108.push(_loc7_);
         }
      }
      
      override public function revert() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:_70 = null;
         var _loc4_:_237 = null;
         _loc1_ = int(this._3108.length - 1);
         while(_loc1_ >= 0)
         {
            this._3108[_loc1_].revert();
            _loc1_--;
         }
         _loc1_ = 0;
         _loc2_ = int(this._3422.length);
         while(_loc1_ < _loc2_)
         {
            _loc3_ = this._3422[_loc1_] as _70;
            _loc4_ = new _237();
            _loc4_._1572(_469._2900(_loc3_));
            _loc4_._2893();
            _loc1_++;
         }
         this._2894();
      }
      
      private function _2894() : void
      {
         this._2852._3024();
         this._2852._3132();
         this._2852._3002();
         this._2852.refresh();
         _570(_1407.getInstance(_570)).refresh();
         _576(_1407.getInstance(_576)).refresh();
      }
      
      private function get _13756() : Array
      {
         return _2223._13756 as Array;
      }
      
      private function get _13759() : Array
      {
         return _2223._13759 as Array;
      }
      
      private function get _13760() : Array
      {
         return _2223._13760 as Array;
      }
      
      private function get _13761() : Array
      {
         return _2223._13761 as Array;
      }
      
      private function get _13758() : Array
      {
         return _2223._13758 as Array;
      }
      
      private function get _13757() : Array
      {
         return _2223._13757 as Array;
      }
      
      private function get _2978() : Array
      {
         return _2223._2978 as Array;
      }
      
      private function get _3422() : Array
      {
         return _2223._3422 as Array;
      }
      
      private function get _3419() : _13508
      {
         return _2223.targetSlotTimeline as _13508;
      }
      
      private function get _3420() : _13504
      {
         return _2223.targetBoneTimeline as _13504;
      }
      
      override protected function _2211() : *
      {
         return _2208;
      }
      
      override public function _1572(param1:*) : void
      {
         super._1572(param1);
         _2208 = param1;
      }
      
      private function get _2852() : TimelinePanelController
      {
         return _1407.getInstance(TimelinePanelController) as TimelinePanelController;
      }
   }
}

