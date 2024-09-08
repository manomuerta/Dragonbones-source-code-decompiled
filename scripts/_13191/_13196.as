package _13191
{
   import _1404._1407;
   import _18.IAction;
   import _226._265;
   import _51._70;
   import _51._79;
   import _555._13202;
   import _708._719;
   import _81._86;
   
   public class _13196 extends _265
   {
      public function _13196()
      {
         super();
      }
      
      override public function _1572(param1:*) : void
      {
         super._1572(param1);
         if(this.displayVO == null)
         {
            _2223.displayVO = this._1837._2049;
         }
         _2213();
         _2223.newLocalTransform = this._11216(_2977);
         this._2973(_2977);
         _2223.oldLocalTransform = this._11216(_2976);
         this._2973(_2976);
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
         this._11213(_2223.newLocalTransform);
         this._2894();
      }
      
      override public function revert() : void
      {
         super.revert();
         this._11213(_2223.oldLocalTransform);
         this._2894();
      }
      
      protected function _11213(param1:_86) : void
      {
         this.displayVO.localTransform.copyFrom(param1,true);
      }
      
      private function _2894() : void
      {
         _2212._2907(this._1837);
         this._13241._3173();
      }
      
      protected function _2973(param1:_86) : void
      {
         var _loc2_:_86 = null;
         var _loc3_:_86 = null;
         if(_2974 == _719.LOCAL)
         {
            _loc2_ = param1;
         }
         else if(_2974 == _719.GLOBAL)
         {
            _loc2_ = this._1837._2143(param1);
         }
         this.displayVO.localTransform.copyFrom(_loc2_,true);
      }
      
      override public function get _2971() : _86
      {
         if(_2974 == _719.LOCAL)
         {
            return this.displayVO.localTransform;
         }
         if(_2974 == _719.GLOBAL)
         {
            return this._1837.globalTransform;
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
      
      protected function get _1837() : _79
      {
         return _2223._1897 as _79;
      }
      
      protected function get displayVO() : _70
      {
         return _2223.displayVO as _70;
      }
      
      private function get _13241() : _13202
      {
         return _1407.getInstance(_13202) as _13202;
      }
   }
}

