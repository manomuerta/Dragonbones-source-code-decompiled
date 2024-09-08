package _226
{
   import _13492._13495;
   import _13492._13498;
   import _13492._13499;
   import _13503._13502;
   import _13505._13504;
   import _13505._13508;
   import _1404._1407;
   import _18.IAction;
   import _51._52;
   import _51._79;
   import _555._570;
   import _555._576;
   import _573.TimelinePanelController;
   import _708._718;
   import _81._86;
   import _81._88;
   import _93._92;
   import flash.geom.Matrix;
   
   public class _258 extends _92
   {
      private var _3004:_86;
      
      private var _3003:_86;
      
      public function _258()
      {
         super();
         _2219 = true;
         _2215 = true;
         _2224 = true;
      }
      
      override public function _1572(param1:*) : void
      {
         super._1572(param1);
         if(!this._2852._13704)
         {
            return;
         }
         _2223._1992 = this._2852._13704;
      }
      
      override protected function _2211() : *
      {
         var _loc1_:Object = {
            "_1897":_2223._1897,
            "_2953":[]
         };
         var _loc2_:int = 0;
         var _loc3_:int = int(this._2993.length);
         while(_loc2_ < _loc3_)
         {
            (_loc1_._2953 as Array).push(this._2993[_loc2_],this._1836.globalTransform[this._2993[_loc2_]]);
            _loc2_ += 2;
         }
         return _loc1_;
      }
      
      override public function execute() : void
      {
         super.execute();
         this._2893();
         this._2894();
      }
      
      override public function revert() : void
      {
         super.revert();
         this._2973(this._2976);
         this._2894();
      }
      
      override public function merge(param1:IAction) : Boolean
      {
         var _loc2_:_258 = param1 as _258;
         if(_loc2_)
         {
            this._3004 = _loc2_._2977;
            return true;
         }
         return false;
      }
      
      public function _2893() : void
      {
         this._2973(this._2977);
      }
      
      public function _2894() : void
      {
         (_1407.getInstance(TimelinePanelController) as TimelinePanelController)._3002();
         _2212._2907(this._1837);
         _576(_1407.getInstance(_576)).refresh();
         _570(_1407.getInstance(_570)).refresh();
      }
      
      protected function _2973(param1:_86) : void
      {
         var _loc4_:Matrix = null;
         var _loc9_:Number = NaN;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:_86 = null;
         var _loc17_:Matrix = null;
         var _loc18_:_13498 = null;
         var _loc19_:_13499 = null;
         var _loc20_:_13498 = null;
         var _loc21_:_13495 = null;
         var _loc2_:_86 = this._1837.globalTransform;
         var _loc3_:Matrix = new Matrix();
         _88._2013(param1,_loc3_);
         _loc4_ = new Matrix();
         var _loc5_:_86 = _loc2_._2195(_loc3_,param1,null,true,_loc4_);
         _loc4_.invert();
         var _loc6_:_86 = this._1837.currentLocalTransform;
         var _loc7_:Matrix = new Matrix();
         _88._2013(_loc6_,_loc7_);
         _loc4_.concat(_loc7_);
         var _loc8_:Number = _loc6_.scaleX * _loc2_.scaleX * param1.scaleX;
         _loc9_ = _loc6_.scaleY * _loc2_.scaleY * param1.scaleY;
         var _loc10_:_13504 = this._1992._1873(this._1836);
         var _loc11_:_13508 = this._1992._1875(this._1836._1882);
         var _loc12_:Array = _loc11_._13572._1816;
         _loc15_ = new _86();
         var _loc16_:Matrix = new Matrix();
         _loc13_ = 0;
         _loc14_ = int(_loc12_.length);
         while(_loc13_ < _loc14_)
         {
            _loc21_ = _loc12_[_loc13_] as _13495;
            if(_loc21_._13613 == this._1837._1923)
            {
               _loc18_ = _loc10_._13581._1816[_loc13_] as _13498;
               _loc19_ = _loc10_._13586._1816[_loc13_] as _13499;
               _loc20_ = _loc10_._13598._1816[_loc13_] as _13498;
               _loc15_.x = _loc18_._13638.x;
               _loc15_.y = _loc18_._13638.y;
               _loc15_.rotation = _loc19_._13639;
               _loc15_.scaleX = _loc20_._13638.x;
               _loc15_.scaleY = _loc20_._13638.y;
               _88._2013(_loc15_,_loc16_);
               _loc17_ = _loc4_.clone();
               _loc17_.concat(_loc16_);
               _88._2014(_loc17_,_loc15_,_loc15_.scaleX * _loc8_ > 0,_loc15_.scaleY * _loc9_ > 0);
               _loc18_._13641(_loc15_.x,_loc15_.y);
               _loc19_.value = _loc15_.rotation;
               _loc20_._13641(_loc15_.scaleX,_loc15_.scaleY);
            }
            _loc13_++;
         }
         this._1837.currentLocalTransform.copyFrom(_loc5_,true);
      }
      
      protected function _1947(param1:Array) : _86
      {
         var _loc4_:_718 = null;
         var _loc5_:* = undefined;
         var _loc2_:_86 = this._2971.clone();
         if(!_loc2_)
         {
            _loc2_ = new _86();
         }
         var _loc3_:int = int(param1.length);
         var _loc6_:int = 0;
         while(_loc6_ < _loc3_)
         {
            _loc4_ = param1[_loc6_];
            _loc5_ = param1[_loc6_ + 1];
            _loc2_[_loc4_.toString()] = _loc5_;
            _loc6_ += 2;
         }
         return _loc2_;
      }
      
      override public function clearCache() : void
      {
         this._3004 = null;
      }
      
      protected function get _2977() : _86
      {
         this._3004 = !!this._3004 ? this._3004 : this._1947(this._2993);
         return this._3004;
      }
      
      protected function get _2976() : _86
      {
         this._3003 = !!this._3003 ? this._3003 : this._1947(this._3000);
         return this._3003;
      }
      
      public function get _1836() : _52
      {
         return _2223._1897;
      }
      
      public function get _1837() : _79
      {
         return this._1836._1882;
      }
      
      public function get _2971() : _86
      {
         return this._1836.globalTransform;
      }
      
      public function get _2993() : Array
      {
         return _2223._2953;
      }
      
      protected function get _3000() : Array
      {
         return _2208._2953;
      }
      
      protected function get _1992() : _13502
      {
         return _2223._1992;
      }
      
      protected function get _2852() : TimelinePanelController
      {
         return _1407.getInstance(TimelinePanelController) as TimelinePanelController;
      }
   }
}

