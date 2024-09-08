package _13527
{
   import _13492._13498;
   import _13492._13499;
   import _13505._13510;
   import _13515._13521;
   import _13515._13532;
   import _1404._1407;
   import _226._265;
   import _40._39;
   import _51._52;
   import _555._576;
   import _573.TimelinePanelController;
   import _586._596;
   import _586._599;
   import _708._719;
   import _81._86;
   import _93._92;
   import flash.geom.Point;
   
   public class _13526 extends _265
   {
      private var _3108:Vector.<_92>;
      
      public function _13526()
      {
         super();
         this._3108 = new Vector.<_92>();
      }
      
      override public function execute() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:_86 = null;
         if(this._3108.length == 0)
         {
            _loc3_ = this._3400(_2977);
            if(!this.autoKey)
            {
               this._3402(_loc3_);
            }
            else
            {
               _loc3_._1930(this._1836._1724);
               this._3403(_loc3_);
            }
         }
         _loc1_ = 0;
         _loc2_ = int(this._3108.length);
         while(_loc1_ < _loc2_)
         {
            this._3108[_loc1_].execute();
            _loc1_++;
         }
         this._2894();
      }
      
      public function _14420() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:_86 = null;
         if(this._3108.length == 0)
         {
            _loc3_ = this._3400(_2977);
            if(!this.autoKey)
            {
               this._3402(_loc3_);
            }
            else
            {
               _loc3_._1930(this._1836._1724);
               this._3403(_loc3_);
            }
         }
         _loc1_ = 0;
         _loc2_ = int(this._3108.length);
         while(_loc1_ < _loc2_)
         {
            this._3108[_loc1_].execute();
            _loc1_++;
         }
         if(this._1836.parentBoneData)
         {
            this._1836.parentBoneData._2027 = true;
            _2212._2881(this._1836.parentBoneData);
         }
         else
         {
            _2212._2881(this._1836);
         }
      }
      
      override public function revert() : void
      {
         var _loc1_:int = 0;
         _loc1_ = int(this._3108.length - 1);
         while(_loc1_ >= 0)
         {
            this._3108[_loc1_].revert();
            _loc1_--;
         }
         this._2894();
      }
      
      public function _14421() : void
      {
         var _loc1_:int = 0;
         _loc1_ = int(this._3108.length - 1);
         while(_loc1_ >= 0)
         {
            this._3108[_loc1_].revert();
            _loc1_--;
         }
         if(this._1836.parentBoneData)
         {
            this._1836.parentBoneData._2027 = true;
            _2212._2881(this._1836.parentBoneData);
         }
         else
         {
            _2212._2881(this._1836);
         }
      }
      
      public function _2894() : void
      {
         if(this._1836.parentBoneData)
         {
            this._1836.parentBoneData._2027 = true;
            _2212._2881(this._1836.parentBoneData);
         }
         else
         {
            _2212._2881(this._1836);
         }
         if(this.autoKey)
         {
            this._2852.refresh();
         }
         this._3443.refresh();
         this._2852._3140();
         this._2852._3002();
         _576(_1407.getInstance(_576)).refresh();
      }
      
      public function _14423() : void
      {
         if(this.autoKey && _599._14425)
         {
            this._2852.refresh();
         }
         this._2852._3140();
         this._2852._3002();
      }
      
      protected function _3400(param1:_86) : _86
      {
         if(_2974 == _719.LOCAL || !this._1836.parentBoneData)
         {
            return param1.clone();
         }
         return param1._2195(this._1836.parentBoneData._2009,this._1836.parentBoneData.globalTransform,this._1836._2036,true);
      }
      
      protected function _3402(param1:_86) : void
      {
         if(this._1836._2002)
         {
            this._1836._2002.copyFrom(param1);
         }
         else
         {
            this._1836._2002 = param1;
         }
         if(this._13581)
         {
            this._1836._13657 = true;
         }
         if(this._13595)
         {
            this._1836._13658 = true;
         }
         if(this._13598)
         {
            this._1836._13659 = true;
         }
         this._1836._2002._1738();
         _2209._3401(this._1836);
      }
      
      protected function _3403(param1:_86) : void
      {
         var _loc2_:_13532 = null;
         var _loc3_:_13521 = null;
         var _loc4_:Object = null;
         var _loc5_:Point = null;
         var _loc6_:Point = null;
         var _loc7_:Point = null;
         var _loc8_:Point = null;
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         if(Boolean(this._13581) && Boolean(this._13627))
         {
            if(this._13581._5819(this._13627.startPos))
            {
               _loc5_ = new Point(param1.x,param1.y);
               _loc6_ = this._13627._13638;
               _loc2_ = new _13532();
               (_loc4_ = {})._1945 = this._13581;
               _loc4_._1946 = this._13627;
               _loc4_.newValue = _loc5_;
               _loc4_.oldValue = _loc6_;
               _loc2_._1572(_loc4_);
               this._3108.push(_loc2_);
            }
            else
            {
               this._13627._13638.x = param1.x;
               this._13627._13638.y = param1.y;
               _loc3_ = new _13521();
               (_loc4_ = {})._1945 = this._13581;
               _loc4_._1946 = this._13627;
               _loc3_._1572(_loc4_);
               this._3108.push(_loc3_);
            }
         }
         if(Boolean(this._13598) && Boolean(this._13631))
         {
            if(this._13598._5819(this._13631.startPos))
            {
               _loc7_ = new Point(param1.scaleX,param1.scaleY);
               _loc8_ = this._13631._13638;
               _loc2_ = new _13532();
               (_loc4_ = {})._1945 = this._13598;
               _loc4_._1946 = this._13631;
               _loc4_.newValue = _loc7_;
               _loc4_.oldValue = _loc8_;
               _loc2_._1572(_loc4_);
               this._3108.push(_loc2_);
            }
            else
            {
               this._13631._13638.x = param1.scaleX;
               this._13631._13638.y = param1.scaleY;
               _loc3_ = new _13521();
               (_loc4_ = {})._1945 = this._13598;
               _loc4_._1946 = this._13631;
               _loc3_._1572(_loc4_);
               this._3108.push(_loc3_);
            }
         }
         if(Boolean(this._13595) && Boolean(this._13710))
         {
            if(this._13595._5819(this._13710.startPos))
            {
               _loc9_ = param1.rotation;
               _loc10_ = this._13710._13639;
               _loc2_ = new _13532();
               (_loc4_ = {})._1945 = this._13595;
               _loc4_._1946 = this._13710;
               _loc4_.newValue = _loc9_;
               _loc4_.oldValue = _loc10_;
               _loc2_._1572(_loc4_);
               this._3108.push(_loc2_);
            }
            else
            {
               this._13710.value = param1.rotation;
               _loc3_ = new _13521();
               (_loc4_ = {})._1945 = this._13595;
               _loc4_._1946 = this._13710;
               _loc3_._1572(_loc4_);
               this._3108.push(_loc3_);
            }
         }
      }
      
      private function addFrame(param1:_86) : void
      {
         var _loc2_:_13521 = null;
         var _loc3_:Object = null;
         if(Boolean(this._13581) && Boolean(this._13627))
         {
            this._13627._13638.x = param1.x;
            this._13627._13638.y = param1.y;
            _loc2_ = new _13521();
            _loc3_ = {};
            _loc3_._1945 = this._13581;
            _loc3_._1946 = this._13627;
            _loc2_._1572(_loc3_);
            this._3108.push(_loc2_);
         }
         if(Boolean(this._13598) && Boolean(this._13631))
         {
            this._13631._13638.x = param1.scaleX;
            this._13631._13638.y = param1.scaleY;
            _loc2_ = new _13521();
            _loc3_ = {};
            _loc3_._1945 = this._13598;
            _loc3_._1946 = this._13631;
            _loc2_._1572(_loc3_);
            this._3108.push(_loc2_);
         }
         if(Boolean(this._13595) && Boolean(this._13710))
         {
            this._13710.value = param1.rotation;
            _loc2_ = new _13521();
            _loc3_ = {};
            _loc3_._1945 = this._13595;
            _loc3_._1946 = this._13710;
            _loc2_._1572(_loc3_);
            this._3108.push(_loc2_);
         }
      }
      
      protected function get _1836() : _52
      {
         return _2223._1897 as _52;
      }
      
      override public function get _2971() : _86
      {
         if(_2974 == _719.LOCAL)
         {
            return this._1836.currentLocalTransform;
         }
         if(_2974 == _719.GLOBAL)
         {
            return this._1836.globalTransform;
         }
         return null;
      }
      
      protected function get _1992() : _39
      {
         return _2223._1992;
      }
      
      protected function get frameIndex() : int
      {
         return _2223.frameIndex;
      }
      
      protected function get _13581() : _13510
      {
         return _2223._13581;
      }
      
      protected function get _13595() : _13510
      {
         return _2223._13595;
      }
      
      protected function get _13598() : _13510
      {
         return _2223._13598;
      }
      
      protected function get _13627() : _13498
      {
         return _2223._13627;
      }
      
      protected function get _13710() : _13499
      {
         return _2223._13710;
      }
      
      protected function get _13631() : _13498
      {
         return _2223._13631;
      }
      
      protected function get _3005() : Boolean
      {
         return _2223._3005;
      }
      
      protected function get autoKey() : Boolean
      {
         return _2223.autoKey;
      }
      
      protected function get _2852() : TimelinePanelController
      {
         return _1407.getInstance(TimelinePanelController) as TimelinePanelController;
      }
      
      protected function get _3443() : _596
      {
         return _1407.getInstance(_596) as _596;
      }
   }
}

