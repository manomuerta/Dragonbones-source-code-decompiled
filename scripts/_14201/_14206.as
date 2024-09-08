package _14201
{
   import _14193._14197;
   import _14193._14199;
   import _14223._14226;
   import _14240._14246;
   import flash.display.Graphics;
   
   public class _14206 extends _14199
   {
      private var _15318:Number;
      
      private var _15317:Number;
      
      private var _15353:Number;
      
      private var _15354:Number;
      
      private var _15320:String;
      
      private var _15321:String;
      
      private var _15356:String;
      
      private var _15355:String;
      
      public function _14206()
      {
         super("ellipse");
      }
      
      public function get _15322() : String
      {
         return this._15320;
      }
      
      public function set _15322(param1:String) : void
      {
         if(this._15320 != param1)
         {
            this._15320 = param1;
            _15272();
         }
      }
      
      public function get _15323() : String
      {
         return this._15321;
      }
      
      public function set _15323(param1:String) : void
      {
         if(this._15321 != param1)
         {
            this._15321 = param1;
            _15272();
         }
      }
      
      public function get _15358() : String
      {
         return this._15356;
      }
      
      public function set _15358(param1:String) : void
      {
         this._15356 = param1;
         _15272();
      }
      
      public function get _15357() : String
      {
         return this._15355;
      }
      
      public function set _15357(param1:String) : void
      {
         this._15355 = param1;
         _15272();
      }
      
      override protected function _15291() : void
      {
         super._15291();
         this._15318 = _15258(this._15322,_14246.WIDTH);
         this._15317 = _15258(this._15323,_14246.HEIGHT);
         this._15353 = _15258(this._15358,_14246.WIDTH);
         this._15354 = _15258(this._15357,_14246.HEIGHT);
      }
      
      override protected function _15288(param1:_14226) : void
      {
         param1.moveTo(this._15318 + this._15353,this._15317);
         param1._15324(this._15353,this._15354,0,true,false,this._15318 - this._15353,this._15317);
         param1._15324(this._15353,this._15354,0,true,false,this._15318 + this._15353,this._15317);
      }
      
      override protected function _15283(param1:Graphics) : void
      {
         param1.drawEllipse(this._15318 - this._15353,this._15317 - this._15354,this._15353 * 2,this._15354 * 2);
      }
      
      override protected function get _15281() : Boolean
      {
         return true;
      }
      
      override public function clone(param1:Boolean = true) : _14197
      {
         var _loc2_:_14206 = super.clone(param1) as _14206;
         _loc2_._15322 = this._15322;
         _loc2_._15323 = this._15323;
         _loc2_._15358 = this._15358;
         _loc2_._15357 = this._15357;
         return _loc2_;
      }
   }
}

