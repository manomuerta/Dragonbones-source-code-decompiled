package _388
{
   import _1404._1407;
   import _338._337;
   import _338._339;
   import _51._50;
   import _521._532;
   import _521._535;
   import _555._571;
   import _703._702;
   import _755._759;
   import _755._760;
   import _93._92;
   
   public class _408 extends _92
   {
      public var _3353:_339;
      
      public var _3352:_337;
      
      public var _3358:Object;
      
      public var _3359:Object;
      
      public function _408()
      {
         this._3353 = new _339();
         this._3352 = new _337();
         this._3358 = {};
         this._3359 = {};
         super();
      }
      
      override public function _1572(param1:*) : void
      {
         if(!param1)
         {
            param1 = {};
         }
         super._1572(param1);
      }
      
      public function get _2880() : _571
      {
         return _1407.getInstance(_571) as _571;
      }
      
      public function get _3340() : _760
      {
         return this._2880._2871._3286;
      }
      
      public function get _3365() : _759
      {
         return this._3340["visibleFilter"];
      }
      
      public function get _3366() : _759
      {
         return this._3340["selectableFilter"];
      }
      
      public function get _3369() : _535
      {
         return _1407.getInstance(_535) as _535;
      }
      
      public function get _3370() : _532
      {
         return _1407.getInstance(_532) as _532;
      }
      
      public function get _1886() : _50
      {
         return this._2880._3361._1886;
      }
      
      public function get _3362() : Vector.<_702>
      {
         return this._2880._3362;
      }
      
      public function get _3363() : Vector.<_702>
      {
         return this._2880._3363;
      }
      
      public function get _3364() : Array
      {
         return this._3370._3349(this._1886);
      }
      
      public function get _3354() : Array
      {
         var _loc3_:_702 = null;
         var _loc1_:Array = [];
         var _loc2_:Vector.<_702> = this._3363.concat(this._3362);
         for each(_loc3_ in _loc2_)
         {
            if(!this._3370._3367(_loc3_.vo))
            {
               _loc1_.push(_loc3_.vo);
            }
         }
         return _loc1_;
      }
      
      public function get _3368() : Array
      {
         var _loc3_:_702 = null;
         var _loc1_:Array = [];
         var _loc2_:Vector.<_702> = this._3363.concat(this._3362);
         for each(_loc3_ in _loc2_)
         {
            if(this._3369._3371(_loc3_.vo))
            {
               _loc1_.push(_loc3_.vo);
            }
         }
         return _loc1_;
      }
      
      public function get _3355() : Array
      {
         var _loc3_:_702 = null;
         var _loc1_:Array = [];
         var _loc2_:Vector.<_702> = this._3363.concat(this._3362);
         for each(_loc3_ in _loc2_)
         {
            if(!this._3369._3371(_loc3_.vo))
            {
               _loc1_.push(_loc3_.vo);
            }
         }
         return _loc1_;
      }
      
      public function get _3372() : Array
      {
         var _loc3_:_702 = null;
         var _loc1_:Array = [];
         var _loc2_:Vector.<_702> = this._3362;
         for each(_loc3_ in _loc2_)
         {
            if(!this._3369._3371(_loc3_.vo))
            {
               _loc1_.push(_loc3_.vo);
            }
         }
         return _loc1_;
      }
      
      public function get _3373() : Array
      {
         var _loc3_:_702 = null;
         var _loc1_:Array = [];
         var _loc2_:Vector.<_702> = this._3362;
         for each(_loc3_ in _loc2_)
         {
            if(this._3369._3371(_loc3_.vo))
            {
               _loc1_.push(_loc3_.vo);
            }
         }
         return _loc1_;
      }
      
      public function get _3374() : Array
      {
         var _loc3_:_702 = null;
         var _loc1_:Array = [];
         var _loc2_:Vector.<_702> = this._3363;
         for each(_loc3_ in _loc2_)
         {
            if(!this._3369._3371(_loc3_.vo))
            {
               _loc1_.push(_loc3_.vo);
            }
         }
         return _loc1_;
      }
      
      public function get _3375() : Array
      {
         var _loc3_:_702 = null;
         var _loc1_:Array = [];
         var _loc2_:Vector.<_702> = this._3363;
         for each(_loc3_ in _loc2_)
         {
            if(this._3369._3371(_loc3_.vo))
            {
               _loc1_.push(_loc3_.vo);
            }
         }
         return _loc1_;
      }
   }
}

