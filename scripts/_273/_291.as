package _273
{
   import _1404._1407;
   import _226._265;
   import _51._52;
   import _51._79;
   import _54._63;
   import _555._556;
   import _555._576;
   import _586._589;
   import _586._605;
   import _708._719;
   import _81._86;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   
   public class _291 extends _265
   {
      public function _291()
      {
         super();
      }
      
      override public function _1572(param1:*) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:Array = null;
         var _loc5_:Array = null;
         var _loc6_:Point = null;
         super._1572(param1);
         if(this.tweens.length > 0)
         {
            _loc4_ = [];
            _loc5_ = [];
            _loc2_ = 0;
            _loc3_ = int(this.tweens.length);
            while(_loc2_ < _loc3_)
            {
               _loc4_.push(this.tweens[_loc2_].position.clone());
               _loc6_ = this.tweens[_loc2_].position.clone();
               _loc5_.push(_loc6_);
               _loc2_++;
            }
            _2223.oldTweenValues = _loc4_;
            _2223.newTweenValues = _loc5_;
         }
      }
      
      override public function execute() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Array = null;
         var _loc6_:Array = null;
         var _loc7_:Point = null;
         var _loc8_:Point = null;
         super.execute();
         this._2973(_2977);
         if(Boolean(this.tweens) && this.tweens.length > 0)
         {
            _loc3_ = _2976.x - _2977.x;
            _loc4_ = _2976.y - _2977.y;
            _loc5_ = _2223.newTweenValues;
            _loc6_ = _2223.oldTweenValues;
            _loc1_ = 0;
            _loc2_ = int(_loc5_.length);
            while(_loc1_ < _loc2_)
            {
               _loc7_ = _loc5_[_loc1_];
               _loc8_ = _loc6_[_loc1_];
               _loc7_.x = _loc8_.x + _loc3_;
               _loc7_.y = _loc8_.y + _loc4_;
               _loc1_++;
            }
            _loc1_ = 0;
            _loc2_ = int(this.tweens.length);
            while(_loc1_ < _loc2_)
            {
               this.tweens[_loc1_].value = _2223.newTweenValues[_loc1_];
               _loc1_++;
            }
         }
         this._2894();
      }
      
      override public function revert() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         super.revert();
         this._2973(_2976);
         if(Boolean(this.tweens) && this.tweens.length > 0)
         {
            _loc1_ = int(this.tweens.length - 1);
            while(_loc1_ >= 0)
            {
               this.tweens[_loc1_].value = _2223.oldTweenValues[_loc1_];
               _loc1_--;
            }
         }
         this._2894();
      }
      
      protected function _2973(param1:_86) : void
      {
         var _loc2_:Vector.<_52> = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc6_:_86 = null;
         var _loc7_:Matrix = null;
         var _loc5_:Dictionary = new Dictionary();
         if(!this._2969)
         {
            _loc2_ = new Vector.<_52>();
            _loc2_.push(this._1836);
         }
         else
         {
            _loc2_ = this._1836._2021();
            _loc2_.unshift(this._1836);
         }
         _loc3_ = 0;
         _loc4_ = int(_loc2_.length);
         while(_loc3_ < _loc4_)
         {
            _loc7_ = new Matrix();
            _loc7_.copyFrom(_loc2_[_loc3_]._2009);
            _loc5_[_loc2_[_loc3_]] = _loc7_;
            _loc3_++;
         }
         if(_2974 == _719.LOCAL)
         {
            _loc6_ = param1;
         }
         else if(_2974 == _719.GLOBAL)
         {
            _loc6_ = !!this._1836.parentBoneData ? param1._2195(this._1836.parentBoneData._2009,this._1836.parentBoneData.globalTransform,this._1836._2036,true) : param1;
         }
         if(this._1836._1724.x != _loc6_.x || this._1836._1724.y != _loc6_.y)
         {
            if(this._1836.parentBoneData)
            {
               this._1836.parentBoneData._2027 = true;
            }
         }
         this._1836._1724.copyFrom(_loc6_,true);
         this._1836._1751();
      }
      
      protected function _2894() : void
      {
         if(this._1837)
         {
            this._3112._2907(this._1837);
         }
         this._3112.refresh();
         this._3113._3114();
         this._3113._3115();
         this._3113._2064();
         this._3056.refresh();
         this._3009.refresh();
      }
      
      public function get _1836() : _52
      {
         if(_2223._1897 is _52)
         {
            return _2223._1897 as _52;
         }
         if(_2223._1897 is _79)
         {
            return (_2223._1897 as _79).parentBoneData;
         }
         return null;
      }
      
      public function get _1837() : _79
      {
         if(_2223._1897 is _79)
         {
            return _2223._1897 as _79;
         }
         if(_2223._1897 is _52)
         {
            return (_2223._1897 as _52)._1882;
         }
         return null;
      }
      
      public function get tweens() : Vector.<_63>
      {
         return _2223.tweens as Vector.<_63>;
      }
      
      override public function get _2971() : _86
      {
         if(_2974 == _719.LOCAL)
         {
            return this._1836._1724;
         }
         if(_2974 == _719.GLOBAL)
         {
            return this._1836.globalTransform;
         }
         return null;
      }
      
      protected function get _2969() : Boolean
      {
         return _2223._2969;
      }
      
      protected function get _2968() : Boolean
      {
         return _2223._2968;
      }
      
      protected function get _3112() : _589
      {
         return _1407.getInstance(_589) as _589;
      }
      
      protected function get _3113() : _605
      {
         return _1407.getInstance(_605) as _605;
      }
      
      private function get _3056() : _556
      {
         return _1407.getInstance(_556) as _556;
      }
      
      protected function get _3009() : _576
      {
         return _1407.getInstance(_576) as _576;
      }
   }
}

