package _14201
{
   import _14176._14186;
   import _14193._14197;
   import _14193._14199;
   import _14223._14226;
   import _14223._14228;
   import _14231._14232;
   
   public class _14212 extends _14199
   {
      private var _15386:Boolean = false;
      
      private var _15388:_14228;
      
      private var _path:Vector.<_14186>;
      
      public function _14212()
      {
         super("path");
      }
      
      public function get _15389() : String
      {
         return _1699("path") as String;
      }
      
      public function set _15389(param1:String) : void
      {
         _15253("path",param1);
      }
      
      public function get path() : Vector.<_14186>
      {
         return this._path;
      }
      
      public function set path(param1:Vector.<_14186>) : void
      {
         this._path = param1;
         this._15388 = null;
         _15272();
      }
      
      override protected function _15223(param1:String, param2:Object, param3:Object) : void
      {
         super._15223(param1,param2,param3);
         switch(param1)
         {
            case "path":
               this._15386 = true;
               _2466();
         }
      }
      
      override protected function _2476() : void
      {
         super._2476();
         if(this._15386)
         {
            this._15386 = false;
            this.path = _14232._15387(this._15389);
         }
      }
      
      override protected function _15291() : void
      {
         super._15291();
         this._15388 = new _14228(this.path);
      }
      
      override protected function _15288(param1:_14226) : void
      {
         this._15388.render(param1);
      }
      
      override public function clone(param1:Boolean = true) : _14197
      {
         var _loc4_:_14186 = null;
         var _loc2_:_14212 = super.clone(param1) as _14212;
         var _loc3_:Vector.<_14186> = new Vector.<_14186>();
         for each(_loc4_ in this.path)
         {
            _loc3_.push(_loc4_.clone());
         }
         _loc2_.path = _loc3_;
         return _loc2_;
      }
   }
}

