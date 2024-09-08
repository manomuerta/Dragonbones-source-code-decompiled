package _226
{
   import _1404._1407;
   import _470._469;
   import _51._52;
   import _51._79;
   import _521._532;
   import _708._718;
   import _708._719;
   import _93._92;
   import _97._124;
   import flash.utils.Dictionary;
   
   public class _10602 extends _92
   {
      private var _10693:int = 20;
      
      private var _10692:int = 20;
      
      private var _10691:_52;
      
      private var _2944:Dictionary;
      
      public function _10602()
      {
         super();
         _2215 = true;
         _2219 = true;
      }
      
      override public function execute() : void
      {
         super.execute();
         this.duplicate();
      }
      
      override public function revert() : void
      {
         var _loc1_:_236 = null;
         super.revert();
         if(this._10691)
         {
            _loc1_ = new _236();
            _loc1_._1572(_469._2934(this._10691));
            _loc1_.execute();
         }
      }
      
      private function get _10690() : _52
      {
         return _2223.duplicateObj;
      }
      
      private function duplicate() : void
      {
         this._10691 = null;
         this._2944 = new Dictionary();
         var _loc1_:Vector.<_52> = new Vector.<_52>();
         _loc1_.push(this._10690);
         if(this._10690.parentBoneData)
         {
            this._10689(this._10690.parentBoneData,_loc1_);
            this._10688(this._10690.parentBoneData,_loc1_);
         }
         this._2226._2889 = [this._10691];
      }
      
      private function _10689(param1:_52, param2:Vector.<_52>) : void
      {
         var _loc3_:_52 = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:_52 = null;
         var _loc7_:_227 = null;
         var _loc8_:_719 = null;
         var _loc9_:Array = null;
         var _loc10_:Object = null;
         var _loc11_:_248 = null;
         var _loc12_:_245 = null;
         for each(_loc3_ in param2)
         {
            _loc4_ = _loc3_.name;
            _loc5_ = _124._1747(_loc4_,param1.rootArmatureData._1793);
            _loc6_ = _52._1729(_loc5_,param1);
            this._2944[_loc3_.name] = _loc5_;
            _loc7_ = new _227();
            _loc7_._1572(_469._2916(_loc6_,param1));
            _loc7_.execute();
            _loc8_ = _719.GLOBAL;
            _loc9_ = [_718.ROTATION,_loc3_.globalTransform.rotation,_718.X,_loc3_.globalTransform.x + this._10693,_718.Y,_loc3_.globalTransform.y + this._10693,_718.SCALE_X,_loc3_.globalTransform.scaleX,_718.SCALE_Y,_loc3_.globalTransform.scaleY,_718.SKEW_X,_loc3_.globalTransform.skewX,_718.SKEW_Y,_loc3_.globalTransform.skewY];
            _loc10_ = _469._2980(_loc6_,_loc8_,_loc9_);
            _loc11_ = new _248();
            _loc11_._1572(_loc10_);
            _loc11_._2213();
            _loc11_.execute();
            _loc12_ = new _245();
            _loc12_._1572(_469._2979([_loc6_],[_loc3_.length]));
            _loc12_._2213();
            _loc12_.execute();
            if(!this._10691)
            {
               this._10691 = _loc6_;
            }
            if(_loc3_._2024.length > 0)
            {
               this._10689(_loc6_,_loc3_._2024);
            }
         }
      }
      
      private function _10688(param1:_52, param2:Vector.<_52>) : void
      {
         var _loc3_:_52 = null;
         var _loc4_:String = null;
         var _loc5_:_52 = null;
         var _loc6_:_79 = null;
         var _loc7_:Object = null;
         var _loc8_:_10603 = null;
         for each(_loc3_ in param2)
         {
            _loc4_ = !!this._2944[_loc3_.name] ? this._2944[_loc3_.name] : _loc3_.name;
            _loc5_ = _loc3_.rootArmatureData._1817(_loc4_);
            for each(_loc6_ in _loc3_.rootArmatureData._1780)
            {
               if(_loc6_.parentBoneData == _loc3_)
               {
                  _loc7_ = {
                     "duplicateObj":_loc6_,
                     "parentBone":_loc5_,
                     "Dic":this._2944
                  };
                  (_loc8_ = new _10603())._10693 = this._10692;
                  _loc8_._1572(_loc7_);
                  _loc8_.execute();
               }
            }
            if(_loc3_._2024.length > 0)
            {
               this._10688(_loc5_,_loc3_._2024);
            }
         }
      }
      
      protected function get _2226() : _532
      {
         return _1407.getInstance(_532);
      }
   }
}

