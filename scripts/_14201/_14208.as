package _14201
{
   import _14193._14195;
   import _14193._14197;
   import _14240._14241;
   import flash.display.Bitmap;
   import flash.display.Loader;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.geom.Rectangle;
   import flash.net.URLRequest;
   import flash.utils.ByteArray;
   
   public class _14208 extends _14197 implements _14195
   {
      private var _15362:Boolean = false;
      
      private var _15365:String;
      
      protected var _loader:Loader;
      
      protected var _15361:_14241;
      
      public function _14208()
      {
         super("image");
      }
      
      public function get _15189() : String
      {
         return _1699("preserveAspectRatio") as String;
      }
      
      public function set _15189(param1:String) : void
      {
         _15253("preserveAspectRatio",param1);
      }
      
      public function get _15196() : String
      {
         return _1699("x") as String;
      }
      
      public function set _15196(param1:String) : void
      {
         _15253("x",param1);
      }
      
      public function get _15197() : String
      {
         return _1699("y") as String;
      }
      
      public function set _15197(param1:String) : void
      {
         _15253("y",param1);
      }
      
      public function get _15195() : String
      {
         return _1699("width") as String;
      }
      
      public function set _15195(param1:String) : void
      {
         _15253("width",param1);
      }
      
      public function get _15194() : String
      {
         return _1699("height") as String;
      }
      
      public function set _15194(param1:String) : void
      {
         _15253("height",param1);
      }
      
      public function get _15193() : String
      {
         return _1699("overflow") as String;
      }
      
      public function set _15193(param1:String) : void
      {
         _15253("overflow",param1);
      }
      
      public function get _15316() : String
      {
         return this._15365;
      }
      
      public function set _15316(param1:String) : void
      {
         if(this._15365 != param1)
         {
            this._15365 = param1;
            this._15362 = true;
            _2466();
         }
      }
      
      public function loadURL(param1:String) : void
      {
         if(this._loader != null)
         {
            content.removeChild(this._loader);
            this._loader = null;
         }
         if(param1 != null)
         {
            this._loader = new Loader();
            this._loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this._5787);
            this._loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this._15364);
            this._loader.load(new URLRequest(param1));
            content.addChild(this._loader);
         }
      }
      
      public function _15363(param1:String) : void
      {
         var _loc2_:String = param1.replace(/^data:[a-z\/]*;base64,/,"");
         this._15361 = new _14241(_loc2_);
         this._15361.addEventListener(_14241.COMPLETE,this._15359);
         this._15361.addEventListener(_14241.ERROR,this._15360);
         this._15361.decode();
      }
      
      private function _15359(param1:Event) : void
      {
         this.loadBytes(this._15361.bytes);
         this._15361 = null;
      }
      
      private function _15360(param1:Event) : void
      {
         this._15361 = null;
      }
      
      public function loadBytes(param1:ByteArray) : void
      {
         if(this._loader != null)
         {
            content.removeChild(this._loader);
            this._loader = null;
         }
         if(param1 != null)
         {
            this._loader = new Loader();
            this._loader.contentLoaderInfo.addEventListener(Event.COMPLETE,this._5787);
            this._loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,this._15364);
            this._loader.loadBytes(param1);
            content.addChild(this._loader);
         }
      }
      
      override protected function _2476() : void
      {
         super._2476();
         if(this._15362)
         {
            this._15362 = false;
            if(this._15316 != null && this._15316 != "")
            {
               if(!this._15316.match(/^data:[a-z\/]*;base64,/))
               {
                  throw new Error("nonsupport extra image");
               }
               this._15363(this._15316);
               _15216("loadImage");
            }
         }
      }
      
      private function _5787(param1:Event) : void
      {
         if(this._loader.content is Bitmap)
         {
            (this._loader.content as Bitmap).smoothing = true;
         }
         _15210();
         _15224("loadImage");
      }
      
      private function _15364(param1:IOErrorEvent) : void
      {
         _15210();
         _15224("loadImage");
      }
      
      override protected function _15213() : Rectangle
      {
         if(this._loader == null || this._loader.content == null)
         {
            return null;
         }
         return new Rectangle(0,0,this._loader.content.width,this._loader.content.height);
      }
      
      override public function clone(param1:Boolean = true) : _14197
      {
         var _loc2_:_14208 = super.clone(param1) as _14208;
         _loc2_._15316 = this._15316;
         return _loc2_;
      }
   }
}

