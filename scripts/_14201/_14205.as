package _14201
{
   import _14188._14187;
   import _14193._14196;
   import _14193._14197;
   import _14229.SVGEvent;
   import _14231._14230;
   import _14236._14235;
   import _14240.StringUtil;
   import _14240._14246;
   import com.lorentz.SVG._14234;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   
   use namespace _14234;
   
   public class _14205 extends _14196
   {
      private var _5981:URLLoader;
      
      private var _15352:_14230;
      
      private var _15351:Boolean = false;
      
      private var _15348:Object;
      
      private var _15334:Object;
      
      private var _15327:Boolean = false;
      
      private var _15340:String;
      
      public var baseURL:String;
      
      public var _15333:Boolean = true;
      
      public var _15336:Boolean = true;
      
      public var _15301:String = "Verdana";
      
      public var _15188:Boolean = true;
      
      public var _15293:Function;
      
      public var _15341:Class;
      
      private var _15338:Boolean;
      
      public function _14205()
      {
         this._15348 = {};
         this._15334 = {};
         this._15341 = _14235;
         super("document");
      }
      
      public static function _15350(param1:String) : Boolean
      {
         return param1 != null && (param1.indexOf("http://") == 0 || param1.indexOf("https://") == 0);
      }
      
      public function get _15345() : String
      {
         return this._15340;
      }
      
      public function load(param1:Object) : void
      {
         var _loc2_:URLRequest = null;
         if(this._5981 != null)
         {
            try
            {
               this._5981.close();
            }
            catch(e:Error)
            {
            }
            this._5981 = null;
         }
         if(param1 is URLRequest)
         {
            _loc2_ = param1 as URLRequest;
         }
         else
         {
            if(!(param1 is String))
            {
               throw new Error("Invalid param \'urlOrUrlRequest\'.");
            }
            _loc2_ = new URLRequest(String(param1));
         }
         this._15340 = _loc2_.url.match(/^([^?]*\/)/g)[0];
         this._5981 = new URLLoader();
         this._5981.dataFormat = URLLoaderDataFormat.TEXT;
         this._5981.addEventListener(Event.COMPLETE,this._15328,false,0,true);
         this._5981.addEventListener(IOErrorEvent.IO_ERROR,this._15329,false,0,true);
         this._5981.load(_loc2_);
      }
      
      private function _15328(param1:Event) : void
      {
         if(param1.currentTarget != this._5981)
         {
            return;
         }
         var _loc2_:String = String(this._5981.data);
         this._15347(_loc2_);
         this._5981 = null;
      }
      
      private function _15329(param1:IOErrorEvent) : void
      {
         if(param1.currentTarget != this._5981)
         {
            return;
         }
         this._5981 = null;
      }
      
      public function parse(param1:Object) : void
      {
         this._15340 = null;
         this._15347(param1);
      }
      
      private function _15347(param1:Object) : void
      {
         var _loc2_:XML = null;
         var _loc3_:String = null;
         var _loc4_:Boolean = false;
         if(param1 is String)
         {
            _loc3_ = _14246._15337(String(param1));
            _loc4_ = Boolean(XML.ignoreWhitespace);
            XML.ignoreWhitespace = false;
            _loc2_ = new XML(_loc3_);
            XML.ignoreWhitespace = _loc4_;
         }
         else
         {
            if(!(param1 is XML))
            {
               throw new Error("Invalid param \'xmlOrXmlString\'.");
            }
            _loc2_ = param1 as XML;
         }
         this.parseXML(_loc2_);
      }
      
      private function parseXML(param1:XML) : void
      {
         this.clear();
         if(this._15351)
         {
            this._15352.cancel();
         }
         this._15351 = true;
         dispatchEvent(new SVGEvent(SVGEvent.PARSE_START));
         this._15352 = new _14230(this,param1);
         this._15352.addEventListener(Event.COMPLETE,this._15331);
         this._15352.parse();
      }
      
      protected function _15331(param1:Event) : void
      {
         this._15351 = false;
         this._15352 = null;
         dispatchEvent(new SVGEvent(SVGEvent.PARSE_COMPLETE));
         this._15327 = true;
         if(this._15336)
         {
            this.validate();
         }
      }
      
      override protected function _15256() : void
      {
         super._15256();
         if(this._15327)
         {
            this._15327 = false;
            dispatchEvent(new SVGEvent(SVGEvent.RENDERED));
         }
      }
      
      public function clear() : void
      {
         var _loc1_:String = null;
         _loc1_ = null;
         _15262 = null;
         _15255 = null;
         _15264 = null;
         _15249 = null;
         this._15334 = {};
         style.clear();
         for(_loc1_ in this._15348)
         {
            this._15339(_loc1_);
         }
         while(_2249 > 0)
         {
            removeElementAt(0);
         }
         while(content.numChildren > 0)
         {
            content.removeChildAt(0);
         }
         content.scaleX = 1;
         content.scaleY = 1;
      }
      
      public function set _14694(param1:Object) : void
      {
         this._15334 = param1;
      }
      
      public function get _14694() : Object
      {
         return this._15334;
      }
      
      public function _15332() : Vector.<String>
      {
         var _loc2_:String = null;
         var _loc1_:Vector.<String> = new Vector.<String>();
         for(_loc2_ in this._15334)
         {
            _loc1_.push(_loc2_);
         }
         return _loc1_;
      }
      
      public function _15335(param1:String, param2:_14187) : void
      {
         this._15334[param1] = param2;
      }
      
      public function _15219(param1:String) : _14187
      {
         return this._15334[param1];
      }
      
      public function _15330(param1:String) : _14187
      {
         var _loc2_:_14187 = this._15334[param1];
         delete this._15334[param1];
         return _loc2_;
      }
      
      public function set _14698(param1:Object) : void
      {
         this._15348 = param1;
      }
      
      public function get _14698() : Object
      {
         return this._15348;
      }
      
      public function _15342() : Vector.<String>
      {
         var _loc2_:String = null;
         var _loc1_:Vector.<String> = new Vector.<String>();
         for(_loc2_ in this._15348)
         {
            _loc1_.push(_loc2_);
         }
         return _loc1_;
      }
      
      public function _15346(param1:String, param2:Object) : void
      {
         if(!this._15348[param1])
         {
            this._15348[param1] = param2;
         }
      }
      
      public function hasDefinition(param1:String) : Boolean
      {
         return this._15348[param1] != null;
      }
      
      public function getDefinition(param1:String) : Object
      {
         return this._15348[param1];
      }
      
      public function _15206(param1:String) : _14197
      {
         if(!this.hasDefinition(param1))
         {
            return null;
         }
         return (this.getDefinition(param1) as _14197).clone(true);
      }
      
      public function _15339(param1:String) : void
      {
         if(this._15348[param1])
         {
            this._15348[param1] = null;
         }
      }
      
      _14234 function _15245(param1:_14197) : void
      {
         this.dispatchEvent(new SVGEvent(SVGEvent.ELEMENT_ADDED,param1));
      }
      
      _14234 function _15233(param1:_14197) : void
      {
         this.dispatchEvent(new SVGEvent(SVGEvent.ELEMENT_REMOVED,param1));
      }
      
      public function _15349(param1:String) : String
      {
         var _loc3_:Number = NaN;
         var _loc2_:* = this.baseURL || this._15345;
         if(param1 != null && !_15350(param1) && Boolean(_loc2_))
         {
            if(param1.indexOf("./") == 0)
            {
               param1 = param1.substring(2);
            }
            if(_15350(_loc2_))
            {
               if(param1.charAt(0) == "/")
               {
                  _loc3_ = Number(_loc2_.indexOf("/",8));
                  if(_loc3_ == -1)
                  {
                     _loc3_ = _loc2_.length;
                  }
               }
               else
               {
                  _loc3_ = _loc2_.lastIndexOf("/") + 1;
                  if(_loc3_ <= 8)
                  {
                     _loc2_ += "/";
                     _loc3_ = _loc2_.length;
                  }
               }
               if(_loc3_ > 0)
               {
                  param1 = _loc2_.substring(0,_loc3_) + param1;
               }
            }
            else
            {
               param1 = StringUtil.rtrim(_loc2_,"/") + "/" + param1;
            }
         }
         return param1;
      }
      
      override public function validate() : void
      {
         super.validate();
         if(this._15222 > 0)
         {
            this._15343();
         }
      }
      
      override protected function get _15222() : int
      {
         return super._15222;
      }
      
      override protected function set _15222(param1:int) : void
      {
         if(super._15222 == 0 && param1 > 0)
         {
            this._15343();
         }
         super._15222 = param1;
      }
      
      protected function _15343() : void
      {
         if(!this._15338)
         {
            this._15338 = false;
            if(stage != null)
            {
               stage.addEventListener(Event.ENTER_FRAME,this._15344,false,0,true);
               stage.addEventListener(Event.RENDER,this._15344,false,0,true);
               stage.invalidate();
            }
            else
            {
               addEventListener(Event.ADDED_TO_STAGE,this._15344,false,0,true);
            }
         }
      }
      
      protected function _15344(param1:Event) : void
      {
         this._15338 = false;
         if(this._15351 && !this._15333)
         {
            this._15343();
            return;
         }
         if(param1.type == Event.ADDED_TO_STAGE)
         {
            removeEventListener(Event.ADDED_TO_STAGE,this._15344);
         }
         else
         {
            param1.target.removeEventListener(Event.ENTER_FRAME,this._15344,false);
            param1.target.removeEventListener(Event.RENDER,this._15344,false);
            if(stage == null)
            {
               addEventListener(Event.ADDED_TO_STAGE,this._15344,false,0,true);
               return;
            }
         }
         this.validate();
      }
   }
}

