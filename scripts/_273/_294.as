package _273
{
   import _1404._1407;
   import _226._265;
   import _51._52;
   import _51._79;
   import _555._556;
   import _555._576;
   import _586._589;
   import _586._605;
   import _708._719;
   import _81._86;
   import flash.geom.Matrix;
   import flash.utils.Dictionary;
   
   public class _294 extends _265
   {
      public function _294()
      {
         super();
      }
      
      override public function execute() : void
      {
         super.execute();
         this._2973(_2977);
         this._2894();
      }
      
      override public function revert() : void
      {
         super.revert();
         this._2973(_2976);
         this._2894();
      }
      
      public function _2893() : void
      {
         this._2973(_2977);
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
      
      protected function get _3056() : _556
      {
         return _1407.getInstance(_556) as _556;
      }
      
      protected function get _3009() : _576
      {
         return _1407.getInstance(_576) as _576;
      }
   }
}

