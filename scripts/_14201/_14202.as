package _14201
{
   import _14193._14196;
   import _14193._14197;
   import flash.events.MouseEvent;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   
   public class _14202 extends _14196
   {
      public var _15316:String;
      
      public function _14202()
      {
         super("a");
      }
      
      override protected function initialize() : void
      {
         super.initialize();
         this.buttonMode = true;
         this.addEventListener(MouseEvent.CLICK,this._7234,false,0,true);
      }
      
      protected function _7234(param1:MouseEvent) : void
      {
         if(this._15316 != null && this._15316 != "")
         {
            navigateToURL(new URLRequest(this._15316));
         }
      }
      
      override public function clone(param1:Boolean = true) : _14197
      {
         var _loc2_:_14202 = super.clone(param1) as _14202;
         _loc2_._15316 = this._15316;
         return _loc2_;
      }
   }
}

