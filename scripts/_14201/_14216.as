package _14201
{
   import _14193._14197;
   import _14193._14199;
   import _14223._14226;
   import _14240._14246;
   
   public class _14216 extends _14199
   {
      private var _15395:Number;
      
      private var _15394:Number;
      
      private var _15391:Number;
      
      private var _15390:Number;
      
      private var _15353:Number;
      
      private var _15354:Number;
      
      private var _15314:String;
      
      private var _15315:String;
      
      private var _15393:String;
      
      private var _15392:String;
      
      private var _15356:String;
      
      private var _15355:String;
      
      public function _14216()
      {
         super("rect");
      }
      
      public function get _15196() : String
      {
         return this._15314;
      }
      
      public function set _15196(param1:String) : void
      {
         if(this._15314 != param1)
         {
            this._15314 = param1;
            _15272();
         }
      }
      
      public function get _15197() : String
      {
         return this._15315;
      }
      
      public function set _15197(param1:String) : void
      {
         if(this._15315 != param1)
         {
            this._15315 = param1;
            _15272();
         }
      }
      
      public function get _15195() : String
      {
         return this._15393;
      }
      
      public function set _15195(param1:String) : void
      {
         if(this._15393 != param1)
         {
            this._15393 = param1;
            _15272();
         }
      }
      
      public function get _15194() : String
      {
         return this._15392;
      }
      
      public function set _15194(param1:String) : void
      {
         if(this._15392 != param1)
         {
            this._15392 = param1;
            _15272();
         }
      }
      
      public function get _15358() : String
      {
         return this._15356;
      }
      
      public function set _15358(param1:String) : void
      {
         if(this._15356 != param1)
         {
            this._15356 = param1;
            _15272();
         }
      }
      
      public function get _15357() : String
      {
         return this._15355;
      }
      
      public function set _15357(param1:String) : void
      {
         if(this._15355 != param1)
         {
            this._15355 = param1;
            _15272();
         }
      }
      
      override protected function _15291() : void
      {
         super._15291();
         this._15395 = _15258(this._15196,_14246.WIDTH);
         this._15394 = _15258(this._15197,_14246.HEIGHT);
         this._15391 = _15258(this._15195,_14246.WIDTH);
         this._15390 = _15258(this._15194,_14246.HEIGHT);
         this._15353 = Number.NaN;
         this._15354 = Number.NaN;
         if(this._15358)
         {
            this._15353 = _15258(this._15358,_14246.WIDTH);
            if(!this._15357)
            {
               this._15354 = this._15353;
            }
         }
         if(this._15357)
         {
            this._15354 = _15258(this._15357,_14246.HEIGHT);
            if(!this._15358)
            {
               this._15353 = this._15354;
            }
         }
      }
      
      override protected function _15288(param1:_14226) : void
      {
         if(isNaN(this._15353) || isNaN(this._15354))
         {
            param1.moveTo(this._15395,this._15394);
            param1.lineTo(this._15395 + this._15391,this._15394);
            param1.lineTo(this._15395 + this._15391,this._15394 + this._15390);
            param1.lineTo(this._15395,this._15394 + this._15390);
            param1.lineTo(this._15395,this._15394);
         }
         else
         {
            param1.moveTo(this._15395 + this._15353,this._15394);
            param1.lineTo(this._15395 + this._15391 - this._15353,this._15394);
            param1._15324(this._15354,this._15353,90,false,true,this._15395 + this._15391,this._15394 + this._15354);
            param1.lineTo(this._15395 + this._15391,this._15394 + this._15390 - this._15354);
            param1._15324(this._15354,this._15353,90,false,true,this._15395 + this._15391 - this._15353,this._15394 + this._15390);
            param1.lineTo(this._15395 + this._15353,this._15394 + this._15390);
            param1._15324(this._15354,this._15353,90,false,true,this._15395,this._15394 + this._15390 - this._15354);
            param1.lineTo(this._15395,this._15394 + this._15354);
            param1._15324(this._15354,this._15353,90,false,true,this._15395 + this._15353,this._15394);
         }
      }
      
      override public function clone(param1:Boolean = true) : _14197
      {
         var _loc2_:_14216 = super.clone(param1) as _14216;
         _loc2_._15196 = this._15196;
         _loc2_._15197 = this._15197;
         _loc2_._15195 = this._15195;
         _loc2_._15194 = this._15194;
         _loc2_._15358 = this._15358;
         _loc2_._15357 = this._15357;
         return _loc2_;
      }
   }
}

