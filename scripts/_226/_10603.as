package _226
{
   import _1404._1407;
   import _470._469;
   import _51._52;
   import _51._69;
   import _51._70;
   import _51._79;
   import _521._528;
   import _521._532;
   import _658.Mesh;
   import _724._725;
   import _724._735;
   import _73._74;
   import _81._86;
   import _93._92;
   import _97._101;
   import _97._124;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   
   public class _10603 extends _92
   {
      public var _10693:int = 20;
      
      private var _10695:_79;
      
      public function _10603()
      {
         super();
         _2215 = true;
         _2219 = true;
      }
      
      private static function _1767(param1:Object, param2:_86, param3:Point = null, param4:Boolean = false) : void
      {
         if(param1)
         {
            if(param2)
            {
               param2.x = _1815(param1,_101.A_X,0) || 0;
               param2.y = _1815(param1,_101.A_Y,0) || 0;
               param2.skewX = _1815(param1,_101.A_SKEW_X,0) * _101.ANGLE_TO_RADIAN || 0;
               param2.skewY = _1815(param1,_101.A_SKEW_Y,0) * _101.ANGLE_TO_RADIAN || 0;
               param2.scaleX = _1815(param1,_101.A_SCALE_X,1) || 0;
               param2.scaleY = _1815(param1,_101.A_SCALE_Y,1) || 0;
            }
            if(param3)
            {
               param3.x = _1815(param1,_101.A_PIVOT_X,0) || 0;
               param3.y = _1815(param1,_101.A_PIVOT_Y,0) || 0;
               param2.x -= param3.x;
               param2.y -= param3.y;
            }
         }
      }
      
      private static function _1815(param1:Object, param2:String, param3:Number) : Number
      {
         if(Boolean(param1) && param2 in param1)
         {
            switch(String(param1[param2]))
            {
               case "NaN":
               case "":
               case "false":
               case "null":
               case "undefined":
                  return NaN;
               default:
                  return Number(param1[param2]);
            }
         }
         else
         {
            return param3;
         }
      }
      
      override public function execute() : void
      {
         super.execute();
         this.duplicate();
      }
      
      override public function revert() : void
      {
         var _loc1_:_238 = null;
         super.revert();
         if(this._10695)
         {
            _loc1_ = new _238();
            _loc1_._1572(_469._2896(this._10695));
            _loc1_._2893();
            _loc1_._2894();
         }
      }
      
      private function get _10694() : _79
      {
         return _2223.duplicateObj;
      }
      
      private function get parentBone() : _52
      {
         return _2223.parentBone;
      }
      
      private function get _2944() : Dictionary
      {
         return _2223.Dic;
      }
      
      private function duplicate() : void
      {
         var _loc5_:_69 = null;
         var _loc6_:* = false;
         var _loc7_:_70 = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:_725 = null;
         var _loc11_:_70 = null;
         var _loc12_:_232 = null;
         var _loc13_:Mesh = null;
         this._10695 = null;
         var _loc1_:String = _124._1747(this._10694.name,this._10694.rootArmatureData._1996);
         var _loc2_:_79 = _79._1729(_loc1_,this.parentBone);
         var _loc3_:_233 = new _233();
         _loc3_._1572(_469._2897(_loc2_,this.parentBone));
         _loc3_._2893();
         var _loc4_:Boolean = false;
         _loc8_ = 0;
         _loc9_ = int(this._10694._1715.length);
         while(_loc8_ < _loc9_)
         {
            _loc5_ = this._10694._1715[_loc8_];
            _loc6_ = _loc5_ == this._10694._1923;
            _loc7_ = this._10694._1765[_loc5_];
            if(_loc7_)
            {
               _loc10_ = this._2106._3806(_loc7_.path);
               if(_loc10_ == null)
               {
                  _loc10_ = new _735(_loc7_.path,_loc7_._1813,_loc7_._1806);
               }
               if(_loc7_._2165)
               {
                  _loc13_ = _loc7_.mesh.clone(this._10694.rootArmatureData._1779,this._2944);
                  _loc11_ = _70._2089(_loc13_,_loc10_);
               }
               else if(_loc7_.type == _74.ARMATURE)
               {
                  _loc10_ = this._2106._3810(_loc7_);
                  _loc11_ = _70._2090(_loc10_);
               }
               else
               {
                  _loc11_ = _70._2090(_loc10_);
               }
               _loc11_.localTransform.copyFrom(_loc7_.localTransform);
               _loc12_ = new _232();
               _loc12_._1572(_469._2895(_loc11_,_loc2_.parentBoneData.rootArmatureData._1795.name,_loc2_,null,_loc6_));
               _loc12_._2893();
               if(this._10694._2049 == _loc7_)
               {
                  _loc4_ = true;
                  _loc2_._2156 = _loc11_;
               }
            }
            _loc8_++;
         }
         if(!_loc4_)
         {
            _loc2_._2156 = null;
         }
         _2212._2907(_loc2_);
         _loc2_._1789();
         this._10695 = _loc2_;
         _loc3_._2894();
         this._2226._2484 = _loc2_;
      }
      
      private function get _2106() : _528
      {
         return _1407.getInstance(_528) as _528;
      }
      
      protected function get _2226() : _532
      {
         return _1407.getInstance(_532);
      }
   }
}

