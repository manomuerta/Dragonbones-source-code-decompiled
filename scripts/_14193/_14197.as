package _14193
{
   import _14164._14166;
   import _14188._14187;
   import _14201._14205;
   import _14229.SVGEvent;
   import _14229.StyleDeclarationEvent;
   import _14231._14232;
   import _14240._14244;
   import _14240._14246;
   import _14240._14247;
   import com.lorentz.SVG._14234;
   import flash.display.Sprite;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   
   use namespace _14234;
   
   public class _14197 extends Sprite
   {
      protected var content:Sprite;
      
      private var _mask:_14197;
      
      private var _15230:Number = NaN;
      
      private var _type:String;
      
      private var _id:String;
      
      private var _15217:Boolean = false;
      
      private var _15234:Boolean = false;
      
      private var _15229:Boolean = false;
      
      private var _15265:_14187;
      
      private var _15254:_14187;
      
      private var _15242:_14197;
      
      private var _15231:_14195;
      
      private var _15260:_14205;
      
      private var _15218:int = 0;
      
      private var _15204:int = 0;
      
      private var _15248:Boolean = false;
      
      private var _15228:Boolean = false;
      
      private var _15212:Boolean = false;
      
      private var _15215:Boolean = false;
      
      private var _15208:Object;
      
      private var _15235:Boolean = false;
      
      private var _15236:Boolean = false;
      
      private var _attributes:Object;
      
      private var _15263:Number = 0;
      
      private var _15261:Number = 0;
      
      private var _3688:Number = 0;
      
      private var _3687:Number = 0;
      
      private var _15227:Vector.<_14197>;
      
      private var _15243:Number;
      
      private var _15237:Number;
      
      public var metadata:XML;
      
      public function _14197(param1:String)
      {
         this._15208 = {};
         this._attributes = {};
         this._15227 = new Vector.<_14197>();
         super();
         this._type = param1;
         this.initialize();
      }
      
      protected function initialize() : void
      {
         this._15265 = new _14187();
         this._15254 = new _14187();
         this._15254.addEventListener(StyleDeclarationEvent.PROPERTY_CHANGE,this._15203,false,0,true);
         this.content = new Sprite();
         addChild(this.content);
      }
      
      public function set offsetX(param1:Number) : void
      {
         this._3688 = param1;
      }
      
      public function get offsetX() : Number
      {
         return this._3688;
      }
      
      public function set offsetY(param1:Number) : void
      {
         this._3687 = param1;
      }
      
      public function get offsetY() : Number
      {
         return this._3687;
      }
      
      public function set _14651(param1:Number) : void
      {
         this._15263 = param1;
      }
      
      public function get _14651() : Number
      {
         return this._15263;
      }
      
      public function set _14650(param1:Number) : void
      {
         this._15261 = param1;
      }
      
      public function get _14650() : Number
      {
         return this._15261;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get id() : String
      {
         return this._id;
      }
      
      public function set id(param1:String) : void
      {
         this._id = param1;
      }
      
      public function get _15262() : String
      {
         return this._1699("class") as String;
      }
      
      public function set _15262(param1:String) : void
      {
         this._15253("class",param1);
      }
      
      public function get _15255() : String
      {
         return this._1699("clip-path") as String;
      }
      
      public function set _15255(param1:String) : void
      {
         this._15253("clip-path",param1);
      }
      
      public function get _15264() : String
      {
         return this._1699("mask") as String;
      }
      
      public function set _15264(param1:String) : void
      {
         this._15253("mask",param1);
      }
      
      public function get _15249() : String
      {
         return this._1699("transform") as String;
      }
      
      public function set _15249(param1:String) : void
      {
         this._15253("transform",param1);
      }
      
      public function _1699(param1:String) : Object
      {
         return this._attributes[param1];
      }
      
      public function _15253(param1:String, param2:Object) : void
      {
         var _loc3_:Object = null;
         if(this._attributes[param1] != param2)
         {
            _loc3_ = this._attributes[param1];
            this._attributes[param1] = param2;
            this._15223(param1,_loc3_,param2);
         }
      }
      
      public function _15239(param1:String) : void
      {
         delete this._attributes[param1];
      }
      
      public function _15252(param1:String) : Boolean
      {
         return param1 in this._attributes;
      }
      
      protected function _15223(param1:String, param2:Object, param3:Object) : void
      {
         switch(param1)
         {
            case "class":
               this._15240(true);
               break;
            case "clip-path":
               this._15217 = true;
               this._2466();
               break;
            case "mask":
               this._15234 = true;
               this._2466();
               break;
            case "transform":
               this._15215 = true;
               this._2466();
         }
      }
      
      protected function _15201(param1:_14197) : void
      {
         if(this._15227.indexOf(param1) == -1)
         {
            this._15227.push(param1);
            param1._15232(this);
         }
      }
      
      protected function _15200(param1:_14197) : void
      {
         var _loc2_:int = int(this._15227.indexOf(param1));
         if(_loc2_ != -1)
         {
            this._15227.splice(_loc2_,1);
            param1._15232(null);
         }
      }
      
      public function get style() : _14187
      {
         return this._15265;
      }
      
      public function get _15259() : _14187
      {
         return this._15254;
      }
      
      public function get _15247() : _14197
      {
         return this._15242;
      }
      
      protected function _15232(param1:_14197) : void
      {
         if(this._15242 != param1)
         {
            if(this._15242 != null)
            {
               this._15242._15222 -= this._15218;
               this._15242._15205 -= this._15204;
            }
            this._15242 = param1;
            if(this._15242 != null)
            {
               this._15242._15222 += this._15218;
               this._15242._15205 += this._15204;
            }
            this._15246(this._15242 != null ? this._15242.document : null);
            this._15221(this._15242 != null ? this._15242._15238 : null);
            this._15240();
         }
      }
      
      private function _15246(param1:_14205) : void
      {
         var _loc2_:_14197 = null;
         if(this._15260 != param1)
         {
            if(this._15260)
            {
               this._15260._14234::_15233(this);
            }
            this._15260 = param1;
            if(this._15260)
            {
               this._15260._14234::_15245(this);
            }
            this._15240(true);
            for each(_loc2_ in this._15227)
            {
               _loc2_._15246(param1);
            }
         }
      }
      
      private function _15221(param1:_14195) : void
      {
         var _loc2_:_14197 = null;
         if(this._15231 != param1)
         {
            this._15231 = param1;
            for each(_loc2_ in this._15227)
            {
               _loc2_._15221(param1);
            }
         }
      }
      
      public function get document() : _14205
      {
         return this is _14205 ? this as _14205 : this._15260;
      }
      
      public function get _15238() : _14195
      {
         return this is _14195 ? this as _14195 : this._15231;
      }
      
      protected function get _15222() : int
      {
         return this._15218;
      }
      
      protected function set _15222(param1:int) : void
      {
         var _loc2_:int = param1 - this._15218;
         this._15218 = param1;
         if(this._15242 != null)
         {
            this._15242._15222 += _loc2_;
         }
         if(this._15218 == 0 && _loc2_ != 0)
         {
            dispatchEvent(new SVGEvent(SVGEvent.SYNC_VALIDATED));
            if(this._15204 == 0)
            {
               dispatchEvent(new SVGEvent(SVGEvent.VALIDATED));
               this._15256();
            }
         }
      }
      
      protected function _15256() : void
      {
      }
      
      protected function get _15205() : int
      {
         return this._15204;
      }
      
      protected function set _15205(param1:int) : void
      {
         var _loc2_:int = param1 - this._15204;
         this._15204 = param1;
         if(this._15242 != null)
         {
            this._15242._15205 += _loc2_;
         }
         if(this._15204 == 0 && _loc2_ != 0)
         {
            dispatchEvent(new SVGEvent(SVGEvent.ASYNC_VALIDATED));
            if(this._15218 == 0)
            {
               dispatchEvent(new SVGEvent(SVGEvent.VALIDATED));
            }
         }
      }
      
      protected function invalidate() : void
      {
         if(!this._15248)
         {
            this._15248 = true;
            this._15222 += 1;
            dispatchEvent(new SVGEvent(SVGEvent.INVALIDATE));
         }
      }
      
      public function _15240(param1:Boolean = true) : void
      {
         var _loc2_:_14197 = null;
         if(!this._15228)
         {
            this._15228 = true;
            this.invalidate();
         }
         if(param1)
         {
            for each(_loc2_ in this._15227)
            {
               _loc2_._15240(param1);
            }
         }
      }
      
      public function _2466() : void
      {
         if(!this._15212)
         {
            this._15212 = true;
            this.invalidate();
         }
      }
      
      public function validate() : void
      {
         var _loc1_:_14197 = null;
         if(this._15228)
         {
            this._15250();
         }
         this._15214();
         if(this._15212)
         {
            this._2476();
         }
         if(this._15248)
         {
            this._15248 = false;
            --this._15222;
         }
         if(this._15222 > 0)
         {
            for each(_loc1_ in this._15227)
            {
               _loc1_.validate();
            }
         }
         if(this is _14195)
         {
            this._15210();
         }
      }
      
      public function _15216(param1:String) : void
      {
         if(this._15208[param1] == null)
         {
            this._15208[param1] = true;
            ++this._15205;
         }
      }
      
      public function _15224(param1:String) : void
      {
         if(this._15208[param1] != null)
         {
            --this._15205;
            delete this._15208[param1];
         }
      }
      
      protected function _15207() : _14197
      {
         return this._15247;
      }
      
      protected function _15250() : void
      {
         var _loc4_:String = null;
         var _loc5_:_14187 = null;
         this._15228 = false;
         var _loc1_:_14187 = new _14187();
         var _loc2_:_14197 = this._15207();
         if(_loc2_)
         {
            _loc2_._15259._15186(_loc1_);
         }
         var _loc3_:_14187 = this.document._15219(this._type);
         if(_loc3_)
         {
            _loc3_._15186(_loc1_);
         }
         if(this._15262)
         {
            for each(_loc4_ in this._15262.split(" "))
            {
               _loc5_ = this.document._15219("." + _loc4_);
               if(_loc5_)
               {
                  _loc5_._15186(_loc1_);
               }
            }
         }
         this._15265._15186(_loc1_);
         _loc1_._15187(this._15254);
      }
      
      private function _15203(param1:StyleDeclarationEvent) : void
      {
         this._15244(param1.propertyName,param1.oldValue,param1.newValue);
      }
      
      protected function _15244(param1:String, param2:String, param3:String) : void
      {
         switch(param1)
         {
            case "display":
               this._15235 = true;
               this._2466();
               break;
            case "opacity":
               this._15236 = true;
               this._2466();
               break;
            case "filter":
               this._15229 = true;
               this._2466();
         }
      }
      
      private function _15211() : Matrix
      {
         var _loc2_:Matrix = null;
         var _loc1_:Matrix = null;
         if(this.transform.matrix)
         {
            _loc1_ = this.transform.matrix;
            _loc1_.identity();
         }
         else
         {
            _loc1_ = new Matrix();
         }
         _loc1_.scale(scaleX,scaleY);
         _loc1_.rotate(_14244._15241(rotation));
         _loc1_.translate(x,y);
         if(this._15249 != null)
         {
            _loc2_ = _14232._15220(this._15249);
            if(_loc2_)
            {
               _loc1_.concat(_loc2_);
            }
         }
         return _loc1_;
      }
      
      protected function _15214() : void
      {
         var _loc1_:String = this._15259._15181("font-size");
         if(_loc1_)
         {
            this._15230 = this._15258(_loc1_,_14246.HEIGHT);
         }
         else
         {
            this._15230 = Number.NaN;
         }
      }
      
      protected function _2476() : void
      {
         var _loc1_:String = null;
         var _loc2_:String = null;
         var _loc3_:Array = null;
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:_14166 = null;
         this._15212 = false;
         if(this._15215)
         {
            this._15215 = false;
            transform.matrix = this._15211();
         }
         if(this._15217)
         {
            this._15217 = false;
            if(this._mask != null)
            {
               this.content.mask = null;
               this.content.cacheAsBitmap = false;
               removeChild(this._mask);
               this._15200(this._mask);
               this._mask = null;
            }
            if(this._15255 != null && this._15255 != "" && this._15255 != "none")
            {
               _loc1_ = _14246._15251(this._15255);
               this._mask = this.document._15206(_loc1_);
               this._15201(this._mask);
               addChild(this._mask);
               this.content.mask = this._mask;
            }
         }
         if(this._15234)
         {
            this._15234 = false;
            if(this._mask != null)
            {
               this.content.mask = null;
               this.content.cacheAsBitmap = false;
               removeChild(this._mask);
               this._15200(this._mask);
               this._mask = null;
            }
            if(this._15264 != null && this._15264 != "" && this._15264 != "none")
            {
               _loc2_ = _14246._15251(this._15264);
               this._mask = this.document._15206(_loc2_);
               this._15201(this._mask);
               this._mask.cacheAsBitmap = true;
               this.content.cacheAsBitmap = true;
               addChild(this._mask);
               this.content.mask = this._mask;
            }
         }
         if(this._15235)
         {
            this._15235 = false;
            visible = this._15259._15181("display") != "none" && this._15259._15181("visibility") != "hidden";
         }
         if(this._15236)
         {
            this._15236 = false;
            this.content.alpha = Number(this._15259._15181("opacity") || 1);
         }
         if(this._15229)
         {
            this._15229 = false;
            _loc3_ = [];
            _loc4_ = this._15259._15181("filter");
            if(_loc4_)
            {
               _loc5_ = _14246._15251(_loc4_);
               _loc6_ = this.document.getDefinition(_loc5_) as _14166;
               if(_loc6_)
               {
                  _loc3_ = _loc6_._15170();
               }
            }
            this.filters = _loc3_;
         }
         if(this is _14195)
         {
            this._15225();
         }
      }
      
      protected function _15257(param1:String) : Number
      {
         var _loc2_:Number = 0;
         var _loc3_:Number = 0;
         if(this._15238 != null)
         {
            _loc2_ = this._15238._15192;
            _loc3_ = this._15238._15191;
         }
         return _14246._15257(param1,this._15230,_loc2_,_loc3_);
      }
      
      protected function _15258(param1:String, param2:String) : Number
      {
         var _loc3_:Number = 0;
         var _loc4_:Number = 0;
         if(this._15238 != null)
         {
            _loc3_ = this._15238._15192;
            _loc4_ = this._15238._15191;
         }
         return _14246._15258(param1,this._15230,_loc3_,_loc4_,param2);
      }
      
      public function clone(param1:Boolean = true) : _14197
      {
         var _loc4_:_14195 = null;
         var _loc5_:_14195 = null;
         var _loc2_:Class = Object(this).constructor as Class;
         var _loc3_:_14197 = new _loc2_();
         _loc3_._15262 = this._15262;
         _loc3_._15255 = this._15255;
         _loc3_._15264 = this._15264;
         this._15265._15187(_loc3_.style);
         _loc3_._15249 = this._15249;
         if(this is _14194)
         {
            (_loc3_ as _14194)._15190 = (this as _14194)._15190;
         }
         if(this is _14192)
         {
            (_loc3_ as _14192)._15189 = (this as _14192)._15189;
         }
         if(this is _14195)
         {
            _loc4_ = this as _14195;
            (_loc5_ = _loc3_ as _14195)._15196 = _loc4_._15196;
            _loc5_._15197 = _loc4_._15197;
            _loc5_._15195 = _loc4_._15195;
            _loc5_._15194 = _loc4_._15194;
            _loc5_._15193 = _loc4_._15193;
         }
         return _loc3_;
      }
      
      public function get _15192() : Number
      {
         return this._15243;
      }
      
      public function get _15191() : Number
      {
         return this._15237;
      }
      
      protected function _15225() : void
      {
         var _loc1_:_14195 = this as _14195;
         if(_loc1_ == null)
         {
            throw new Error("Element \'" + this.type + "\' isn\'t a viewPort.");
         }
         if(this is _14194 && (this as _14194)._15190 != null)
         {
            this._15243 = (this as _14194)._15190.width;
            this._15237 = (this as _14194)._15190.height;
         }
         else
         {
            if(_loc1_._15195)
            {
               this._15243 = this._15258(_loc1_._15195,_14246.WIDTH);
            }
            if(_loc1_._15194)
            {
               this._15237 = this._15258(_loc1_._15194,_14246.HEIGHT);
            }
         }
      }
      
      protected function _15213() : Rectangle
      {
         return null;
      }
      
      protected function _15210() : void
      {
         var _loc2_:Rectangle = null;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Rectangle = null;
         var _loc8_:Object = null;
         var _loc9_:Object = null;
         var _loc1_:_14195 = this as _14195;
         if(_loc1_ == null)
         {
            throw new Error("Element \'" + this.type + "\' isn\'t a viewPort.");
         }
         scrollRect = null;
         this.content.scaleX = 1;
         this.content.scaleY = 1;
         this.content.x = 0;
         this.content.y = 0;
         if(this is _14194)
         {
            _loc2_ = (this as _14194)._15190;
         }
         else
         {
            _loc2_ = this._15213();
         }
         if(_loc2_ != null && _loc1_._15195 != null && _loc1_._15194 != null)
         {
            _loc3_ = !!_loc1_._15196 ? this._15258(_loc1_._15196,_14246.WIDTH) : 0;
            _loc4_ = !!_loc1_._15197 ? this._15258(_loc1_._15197,_14246.HEIGHT) : 0;
            _loc5_ = this._15258(_loc1_._15195,_14246.WIDTH);
            _loc6_ = this._15258(_loc1_._15194,_14246.HEIGHT);
            if(_loc1_._15189 != "none")
            {
               _loc7_ = new Rectangle(_loc3_,_loc4_,_loc5_,_loc6_);
               _loc8_ = _14232._15209(String(_loc1_._15189 || ""));
               _loc9_ = _14247._15226(_loc7_,_loc2_,_loc8_.align,_loc8_.meetOrSlice);
               if(_loc8_.meetOrSlice == "slice")
               {
                  this.scrollRect = _loc7_;
               }
               this.content.scaleX = _loc9_.contentScaleX;
               this.content.scaleY = _loc9_.contentScaleY;
               this.content.x = _loc9_.contentX;
               this.content.y = _loc9_.contentY;
            }
            else
            {
               this.content.x = _loc3_;
               this.content.y = _loc4_;
               this.content.scaleX = _loc5_ / this.content.width;
               this.content.scaleY = _loc6_ / this.content.height;
            }
         }
      }
   }
}

