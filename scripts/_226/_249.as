package _226
{
   import _1404._1407;
   import _18.IAction;
   import _388._400;
   import _388._409;
   import _470._469;
   import _51._52;
   import _521._532;
   import _555._570;
   import _555._576;
   import _708._717;
   import _708._718;
   import _708._719;
   import _93._92;
   import egret.utils.tr;
   
   public class _249 extends _92
   {
      public var _2982:_248;
      
      public var _2983:_245;
      
      private var _2226:_532;
      
      public function _249()
      {
         this._2226 = _1407.getInstance(_532) as _532;
         super();
         _2219 = true;
         _2215 = true;
         _2224 = true;
      }
      
      override public function _1572(param1:*) : void
      {
         super._1572(param1);
         this._2982 = new _248();
         this._2982._1572(_469._2980(this._1836,_719.LOCAL,[_718.ROTATION,this.rotation],-1,0));
         this._2982._2213();
         this._2983 = new _245();
         this._2983._1572(_469._2979([this._1836],[this.length]));
         this._2983._2213();
      }
      
      override public function execute() : void
      {
         super.execute();
         this._2982._2893();
         this._2983._2893();
         this._2894();
         this._2981();
      }
      
      private function _2981() : void
      {
         var _loc2_:String = null;
         var _loc3_:_400 = null;
         var _loc4_:_400 = null;
         var _loc1_:_409 = new _409();
         if(this._2226._2889.length == 2)
         {
            this._2226._2984 = true;
            _loc2_ = this._2985();
            if(_loc2_)
            {
               _loc1_._1572({
                  "showText":_loc2_,
                  "type":_717.HIGH_LIGHT
               });
               _loc1_.execute();
            }
         }
         else
         {
            this._2226._2984 = false;
            if(this._2226._2889.length < 1)
            {
               _loc3_ = new _400();
               _loc3_._1572(_717.HIGH_LIGHT);
               _loc3_.execute();
               _loc4_ = new _400();
               _loc4_._1572(_717.DEFAULT);
               _loc4_.execute();
            }
            else
            {
               _loc1_._1572({
                  "showText":this._2226._2484.name,
                  "type":_717.HIGH_LIGHT
               });
               _loc1_.execute();
            }
         }
      }
      
      private function _2985() : String
      {
         var _loc1_:Array = this._2226._2889;
         var _loc2_:int = int(_loc1_.indexOf(_1642._1836));
         if(_loc2_ >= 0)
         {
            _loc1_.splice(_loc2_,1);
            return tr("Tip.Bone.bind",_loc1_[0].name);
         }
         return "";
      }
      
      override public function revert() : void
      {
         this._2982.revert();
         this._2983.revert();
      }
      
      public function _2893() : void
      {
         this._2982._2893();
         this._2983._2893();
      }
      
      protected function _2894() : void
      {
         if(Boolean(this._1836.parentBoneData) && this._1836.parentBoneData._2027)
         {
            _2212._2881(this._1836.parentBoneData);
         }
         else
         {
            _2212._2881(this._1836);
         }
         _576(_1407.getInstance(_576)).refresh();
         _570(_1407.getInstance(_570)).refresh();
      }
      
      override public function merge(param1:IAction) : Boolean
      {
         var _loc2_:_249 = param1 as _249;
         if(!_loc2_ || _loc2_._1836 != this._1836)
         {
            return false;
         }
         this._2982.merge(_loc2_._2982);
         this._2983.merge(_loc2_._2983);
         return true;
      }
      
      public function get _1836() : _52
      {
         return _2223._1836;
      }
      
      private function get length() : Number
      {
         return _2223.length;
      }
      
      private function get rotation() : Number
      {
         return _2223.rotation;
      }
   }
}

