package _425
{
   import _13492._13493;
   import _13492._13494;
   import _13492._13495;
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
   import _708._719;
   import _81._86;
   import _93._92;
   import flash.geom.Point;
   
   public class _429 extends _265
   {
      private var _3108:Vector.<_92>;
      
      public function _429()
      {
         super();
      }
      
      override public function _1572(param1:*) : void
      {
         super._1572(param1);
         this._3108 = new Vector.<_92>();
         var _loc2_:_86 = this._3400(_2977);
         _loc2_._1930(this._1836._1724);
         if(this._3005)
         {
            this.addFrame(_loc2_);
         }
         else
         {
            this._3403(_loc2_);
         }
      }
      
      protected function _3400(param1:_86) : _86
      {
         if(_2974 == _719.LOCAL || !this._1836.parentBoneData)
         {
            return param1.clone();
         }
         return param1._2195(this._1836.parentBoneData._2009,this._1836.parentBoneData.globalTransform,this._1836._2036,true);
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
         if(Boolean(this._13599) && Boolean(this._13632))
         {
            _loc2_ = new _13521();
            _loc3_ = {};
            _loc3_._1945 = this._13599;
            _loc3_._1946 = this._13632;
            _loc2_._1572(_loc3_);
            this._3108.push(_loc2_);
         }
         if(Boolean(this._13593) && Boolean(this._13707))
         {
            _loc2_ = new _13521();
            _loc3_ = {};
            _loc3_._1945 = this._13593;
            _loc3_._1946 = this._13707;
            _loc2_._1572(_loc3_);
            this._3108.push(_loc2_);
         }
         if(Boolean(this._13592) && Boolean(this._13708))
         {
            _loc2_ = new _13521();
            _loc3_ = {};
            _loc3_._1945 = this._13592;
            _loc3_._1946 = this._13708;
            _loc2_._1572(_loc3_);
            this._3108.push(_loc2_);
         }
      }
      
      protected function _3403(param1:_86) : void
      {
         var _loc2_:_13532 = null;
         var _loc3_:Object = null;
         var _loc4_:Point = null;
         var _loc5_:Point = null;
         var _loc6_:Point = null;
         var _loc7_:Point = null;
         var _loc8_:Number = NaN;
         var _loc9_:Number = NaN;
         if(Boolean(this._13581) && Boolean(this._13627))
         {
            _loc4_ = new Point(param1.x,param1.y);
            _loc5_ = this._13627._13638;
            _loc2_ = new _13532();
            _loc3_ = {};
            _loc3_._1945 = this._13581;
            _loc3_._1946 = this._13627;
            _loc3_.newValue = _loc4_;
            _loc3_.oldValue = _loc5_;
            _loc2_._1572(_loc3_);
            this._3108.push(_loc2_);
         }
         if(Boolean(this._13598) && Boolean(this._13631))
         {
            _loc6_ = new Point(param1.scaleX,param1.scaleY);
            _loc7_ = this._13631._13638;
            _loc2_ = new _13532();
            _loc3_ = {};
            _loc3_._1945 = this._13598;
            _loc3_._1946 = this._13631;
            _loc3_.newValue = _loc6_;
            _loc3_.oldValue = _loc7_;
            _loc2_._1572(_loc3_);
            this._3108.push(_loc2_);
         }
         if(Boolean(this._13595) && Boolean(this._13710))
         {
            _loc8_ = param1.rotation;
            _loc9_ = this._13710._13639;
            _loc2_ = new _13532();
            _loc3_ = {};
            _loc3_._1945 = this._13595;
            _loc3_._1946 = this._13710;
            _loc3_.newValue = _loc8_;
            _loc3_.oldValue = _loc9_;
            _loc2_._1572(_loc3_);
            this._3108.push(_loc2_);
         }
      }
      
      override public function execute() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         _loc1_ = 0;
         _loc2_ = int(this._3108.length);
         while(_loc1_ < _loc2_)
         {
            this._3108[_loc1_].execute();
            _loc1_++;
         }
         this._2894();
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
      
      public function _2894() : void
      {
         this._2852._3133();
         this._2852.refresh();
         this._2852._3002();
         this._2852._3140();
         _576(_1407.getInstance(_576)).refresh();
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
      
      protected function get _13599() : _13510
      {
         return _2223._13599;
      }
      
      protected function get _13632() : _13494
      {
         return _2223._13632;
      }
      
      protected function get _13593() : _13510
      {
         return _2223._13593;
      }
      
      protected function get _13707() : _13495
      {
         return _2223._13707;
      }
      
      protected function get _13592() : _13510
      {
         return _2223._13592;
      }
      
      protected function get _13708() : _13493
      {
         return _2223._13708;
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
   }
}

