package _226
{
   import _1404._1407;
   import _18.IAction;
   import _51._79;
   import _555._576;
   import _586._594;
   import _658.Mesh;
   import _658._661;
   import _708._719;
   import _81._86;
   
   public class _264 extends _265
   {
      public function _264()
      {
         super();
      }
      
      override public function _1572(param1:*) : void
      {
         super._1572(param1);
         _2213();
         _2223.newLocalTransform = _2977;
         _2223.oldLocalTransform = _2976;
         if(this._1837._2112())
         {
            _2223.oldOriginFFD = this._11215(this._1837._2049.mesh);
            this._11212(_2977);
            _2223.newOriginFFD = this._11215(this._1837._2049.mesh);
            this._11214(this._1837._2049.mesh,_2223.oldOriginFFD);
         }
      }
      
      override public function merge(param1:IAction) : Boolean
      {
         var _loc2_:Boolean = super.merge(param1);
         if(_loc2_)
         {
            _2223.newLocalTransform = param1._1642.newLocalTransform;
            _2223.newOriginFFD = param1._1642.newOriginFFD;
         }
         return _loc2_;
      }
      
      override public function execute() : void
      {
         super.execute();
         if(this._1837._2112())
         {
            this._11214(this._1837._2049.mesh,_2223.newOriginFFD);
            if(_2974 == _719.GLOBAL)
            {
               this._1837._2049.mesh.globalTransform.copyFrom(_2977);
            }
         }
         this._2973(_2223.newLocalTransform);
      }
      
      override public function revert() : void
      {
         super.revert();
         if(this._1837._2112())
         {
            this._11214(this._1837._2049.mesh,_2223.oldOriginFFD);
            if(_2974 == _719.GLOBAL)
            {
               this._1837._2049.mesh.globalTransform.copyFrom(_2976);
            }
         }
         this._2973(_2223.oldLocalTransform);
      }
      
      protected function _2973(param1:_86) : void
      {
         var _loc2_:_86 = null;
         var _loc3_:_86 = null;
         var _loc4_:Boolean = false;
         if(_2974 == _719.LOCAL)
         {
            _loc2_ = param1;
         }
         else if(_2974 == _719.GLOBAL)
         {
            _loc2_ = this._1837._2143(param1);
         }
         if(this._1837.currentLocalTransform)
         {
            this._1837.currentLocalTransform.copyFrom(_loc2_,true);
         }
         _2212._2907(this._1837);
         _576(_1407.getInstance(_576)).refresh();
         this._3008._3024();
      }
      
      override public function get _2971() : _86
      {
         if(_2974 == _719.LOCAL)
         {
            if(Boolean(this._1837) && Boolean(this._1837._2049))
            {
               return this._1837._2049.localTransform;
            }
         }
         else if(_2974 == _719.GLOBAL)
         {
            if(this._1837)
            {
               return this._1837.globalTransform;
            }
         }
         return null;
      }
      
      protected function _11216(param1:_86) : _86
      {
         var _loc2_:_86 = null;
         var _loc3_:_86 = null;
         var _loc4_:Boolean = false;
         if(_2974 == _719.LOCAL)
         {
            _loc2_ = param1;
         }
         else if(_2974 == _719.GLOBAL)
         {
            _loc2_ = this._1837._2143(param1);
         }
         return _loc2_;
      }
      
      protected function _11212(param1:_86) : void
      {
         var _loc2_:_86 = null;
         var _loc3_:Mesh = this._1837._2049.mesh;
         if(_2974 == _719.LOCAL)
         {
            _loc2_ = new _86();
            _loc2_.copyFrom(param1);
            _loc2_._1930(this._1837.currentLocalTransform);
            _loc3_._3023(_loc2_);
         }
         else if(_2974 == _719.GLOBAL)
         {
            _loc2_ = new _86();
            _loc2_.copyFrom(param1);
            _loc2_._1930(this._1837.globalTransform);
            _loc3_._3023(_loc2_);
         }
      }
      
      private function _11215(param1:Mesh) : Vector.<_661>
      {
         var _loc2_:Vector.<_661> = new Vector.<_661>();
         var _loc3_:int = 0;
         var _loc4_:int = int(param1._1812.length);
         while(_loc3_ < _loc4_)
         {
            _loc2_.push(param1._1812[_loc3_].clone() as _661);
            _loc3_++;
         }
         return _loc2_;
      }
      
      private function _11214(param1:Mesh, param2:Vector.<_661>) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = int(param1._1812.length);
         while(_loc3_ < _loc4_)
         {
            if(param1._1812[_loc3_].id == param2[_loc3_].id)
            {
               param1._1812[_loc3_].x = param2[_loc3_].x;
               param1._1812[_loc3_].y = param2[_loc3_].y;
            }
            _loc3_++;
         }
      }
      
      protected function get _1837() : _79
      {
         return _2223._1897 as _79;
      }
      
      private function get _3008() : _594
      {
         return _1407.getInstance(_594) as _594;
      }
   }
}

