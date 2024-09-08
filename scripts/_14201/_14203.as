package _14201
{
   import _14193._14197;
   import _14193._14199;
   import _14223._14226;
   import _14240._14246;
   import flash.display.Graphics;
   
   public class _14203 extends _14199
   {
      private var _15318:Number;
      
      private var _15317:Number;
      
      private var _15319:Number;
      
      private var _15320:String;
      
      private var _15321:String;
      
      private var _15325:String;
      
      public function _14203()
      {
         super("circle");
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
      
      public function get _15326() : String
      {
         return this._15325;
      }
      
      public function set _15326(param1:String) : void
      {
         this._15325 = param1;
         _15272();
      }
      
      override protected function _15291() : void
      {
         super._15291();
         this._15318 = _15258(this._15322,_14246.WIDTH);
         this._15317 = _15258(this._15323,_14246.HEIGHT);
         this._15319 = _15258(this._15326,_14246.WIDTH);
      }
      
      override protected function _15288(param1:_14226) : void
      {
         param1.moveTo(this._15318 + this._15319,this._15317);
         param1._15324(this._15319,this._15319,0,true,false,this._15318 - this._15319,this._15317);
         param1._15324(this._15319,this._15319,0,true,false,this._15318 + this._15319,this._15317);
      }
      
      override protected function _15283(param1:Graphics) : void
      {
         param1.drawCircle(this._15318,this._15317,this._15319);
      }
      
      override protected function get _15281() : Boolean
      {
         return true;
      }
      
      override public function clone(param1:Boolean = true) : _14197
      {
         var _loc2_:_14203 = super.clone(param1) as _14203;
         _loc2_._15322 = this._15322;
         _loc2_._15323 = this._15323;
         _loc2_._15326 = this._15326;
         return _loc2_;
      }
   }
}

