package _226
{
   import _1404._1407;
   import _18.IAction;
   import _51._50;
   import _51._52;
   import _51._70;
   import _51._78;
   import _51._79;
   import _555._576;
   import _658._660;
   import _708._719;
   import _81._86;
   import flash.geom.Matrix;
   import flash.utils.Dictionary;
   
   public class _248 extends _265
   {
      public function _248()
      {
         super();
      }
      
      override public function _1572(param1:*) : void
      {
         super._1572(param1);
         _2213();
         _2223.newLocalTransform = _2977;
         _2223.oldLocalTransform = _2976;
      }
      
      override public function merge(param1:IAction) : Boolean
      {
         var _loc2_:Boolean = super.merge(param1);
         if(_loc2_)
         {
            _2223.newLocalTransform = param1._1642.newLocalTransform;
         }
         return _loc2_;
      }
      
      override public function execute() : void
      {
         super.execute();
         this._2973(_2977);
         this._2894();
      }
      
      public function _14420() : void
      {
         this._2973(_2223.newLocalTransform);
      }
      
      override public function revert() : void
      {
         super.revert();
         this._2973(_2976);
         this._2894();
         this._14419(this._1836);
      }
      
      public function _14421() : void
      {
         this._2973(_2223.oldLocalTransform);
         this._14419(this._1836);
      }
      
      private function _14419(param1:_52) : void
      {
         if(Boolean(param1.parentBoneData) && param1.parentBoneData._2027)
         {
            _2212._2881(param1.parentBoneData);
            this._14419(param1.parentBoneData);
         }
         else
         {
            _2212._2881(param1);
         }
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
         var _loc8_:_86 = null;
         var _loc9_:_86 = null;
         var _loc10_:Matrix = null;
         var _loc11_:_52 = null;
         var _loc12_:Array = null;
         var _loc13_:_79 = null;
         var _loc14_:Matrix = null;
         var _loc15_:_86 = null;
         var _loc16_:_78 = null;
         var _loc17_:_50 = null;
         var _loc18_:_52 = null;
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
         if(!this._2969 || !this._2968)
         {
            _loc8_ = this._1836.globalTransform.clone();
            this._1836._1751();
            _loc9_ = this._1836.globalTransform;
            _loc10_ = this._1836._2009;
         }
         if(!this._2969)
         {
            for each(_loc11_ in this._1836.rootArmatureData._1779)
            {
               if(_loc11_.parentBoneData == this._1836)
               {
                  _loc6_ = _loc11_.globalTransform._2195(this._1836._2009,this._1836.globalTransform,_loc11_._2036,true);
                  _loc11_._1724.copyFrom(_loc6_,true);
               }
            }
         }
         if(!this._2968)
         {
            _loc12_ = [];
            for each(_loc13_ in this._1836.rootArmatureData._1780)
            {
               if(_loc13_.parentBoneData == this._1836)
               {
                  _loc12_.push(_loc13_);
               }
            }
            if(_loc12_.length > 0)
            {
               _loc14_ = new Matrix();
               _loc15_ = _loc8_._2195(_loc10_,_loc9_,null,true,_loc14_);
               for each(_loc13_ in _loc12_)
               {
                  if(_loc13_._1995)
                  {
                     for each(_loc16_ in this._1836.rootArmatureData._1781)
                     {
                        this._2967(_loc16_,_loc13_,_loc14_,_loc15_);
                     }
                  }
                  else
                  {
                     this._2967(this._1836.rootArmatureData._1795,_loc13_,_loc14_,_loc15_);
                  }
               }
            }
            if(this._12542(_loc2_))
            {
               _loc17_ = _loc2_[0].rootArmatureData;
               if(_loc17_)
               {
                  _loc17_._1751();
                  _loc3_ = 0;
                  _loc4_ = int(_loc2_.length);
                  while(_loc3_ < _loc4_)
                  {
                     _loc18_ = _loc2_[_loc3_];
                     _loc18_._1751();
                     this._2975(_loc18_,_loc5_[_loc18_],_loc18_._2009);
                     _loc3_++;
                  }
               }
            }
            _loc5_ = null;
         }
      }
      
      private function _12542(param1:Vector.<_52>) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:_52 = null;
         var _loc2_:int = 0;
         _loc2_ = 0;
         _loc3_ = int(param1.length);
         while(_loc2_ < _loc3_)
         {
            _loc4_ = param1[_loc2_];
            if(_loc4_._1980 || _loc4_._1957)
            {
               return false;
            }
            _loc2_++;
         }
         return true;
      }
      
      private function _2975(param1:_52, param2:Matrix, param3:Matrix) : void
      {
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:_660 = null;
         var _loc11_:Matrix = null;
         var _loc4_:Matrix = param2.clone();
         _loc4_.invert();
         var _loc5_:Matrix = param3.clone();
         _loc5_.concat(_loc4_);
         var _loc6_:Matrix = _loc5_.clone();
         var _loc7_:Vector.<_660> = this._2972(param1);
         _loc8_ = 0;
         _loc9_ = int(_loc7_.length);
         while(_loc8_ < _loc9_)
         {
            _loc10_ = _loc7_[_loc8_];
            _loc11_ = _loc10_._2970(param1);
            _loc5_ = _loc6_.clone();
            _loc5_.concat(_loc11_);
            _loc10_._2975(param1,_loc5_);
            _loc8_++;
         }
      }
      
      private function _2972(param1:_52) : Vector.<_660>
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:_70 = null;
         var _loc5_:_660 = null;
         var _loc6_:_50 = param1.rootArmatureData;
         var _loc7_:Vector.<_70> = _loc6_._1975();
         var _loc8_:Vector.<_660> = new Vector.<_660>();
         _loc2_ = 0;
         _loc3_ = int(_loc7_.length);
         while(_loc2_ < _loc3_)
         {
            _loc4_ = _loc7_[_loc2_];
            if(_loc4_._2112)
            {
               _loc5_ = _loc4_.mesh.meshRig;
               if((Boolean(_loc5_)) && _loc5_._2922.indexOf(param1) != -1)
               {
                  _loc8_.push(_loc5_);
               }
            }
            _loc2_++;
         }
         return _loc8_;
      }
      
      protected function _2967(param1:_78, param2:_79, param3:Matrix, param4:_86) : void
      {
         var _loc6_:_70 = null;
         var _loc5_:Dictionary = param1._1765[param2];
         if(_loc5_)
         {
            for each(_loc6_ in _loc5_)
            {
               _loc6_.localTransform._2030(param3,param4);
               _loc6_.localTransform._1738();
            }
         }
      }
      
      protected function _2894() : void
      {
         _2212._2939();
         _576(_1407.getInstance(_576)).refresh();
      }
      
      public function get _1836() : _52
      {
         return _2223._1897 as _52;
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
   }
}

