package _14201
{
   import _14193._14197;
   import _14193._14199;
   import _14223._14226;
   import _14240._14246;
   
   public class _14209 extends _14199
   {
      private var _15369:Number;
      
      private var _15366:Number;
      
      private var _15367:Number;
      
      private var _15368:Number;
      
      private var _15370:String;
      
      private var _15371:String;
      
      private var _15372:String;
      
      private var _15373:String;
      
      public function _14209()
      {
         super("line");
      }
      
      public function get _15374() : String
      {
         return this._15370;
      }
      
      public function set _15374(param1:String) : void
      {
         if(this._15370 != param1)
         {
            this._15370 = param1;
            _15272();
         }
      }
      
      public function get _15375() : String
      {
         return this._15371;
      }
      
      public function set _15375(param1:String) : void
      {
         if(this._15371 != param1)
         {
            this._15371 = param1;
            _15272();
         }
      }
      
      public function get _15376() : String
      {
         return this._15372;
      }
      
      public function set _15376(param1:String) : void
      {
         if(this._15372 != param1)
         {
            this._15372 = param1;
            _15272();
         }
      }
      
      public function get _15377() : String
      {
         return this._15373;
      }
      
      public function set _15377(param1:String) : void
      {
         if(this._15373 != param1)
         {
            this._15373 = param1;
            _15272();
         }
      }
      
      override protected function get _15280() : Boolean
      {
         return false;
      }
      
      override protected function _15291() : void
      {
         super._15291();
         this._15369 = _15258(this._15374,_14246.WIDTH);
         this._15366 = _15258(this._15376,_14246.HEIGHT);
         this._15367 = _15258(this._15375,_14246.WIDTH);
         this._15368 = _15258(this._15377,_14246.HEIGHT);
      }
      
      override protected function _15288(param1:_14226) : void
      {
         param1.moveTo(this._15369,this._15366);
         param1.lineTo(this._15367,this._15368);
      }
      
      override public function clone(param1:Boolean = true) : _14197
      {
         var _loc2_:_14209 = super.clone(param1) as _14209;
         _loc2_._15374 = this._15374;
         _loc2_._15375 = this._15375;
         _loc2_._15376 = this._15376;
         _loc2_._15377 = this._15377;
         return _loc2_;
      }
   }
}

