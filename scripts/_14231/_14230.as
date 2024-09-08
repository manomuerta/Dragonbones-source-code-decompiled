package _14231
{
   import _14161._14162;
   import _14164._14163;
   import _14164._14165;
   import _14164._14166;
   import _14164._14167;
   import _14169._14168;
   import _14169._14170;
   import _14169._14171;
   import _14188._14187;
   import _14193._14192;
   import _14193._14194;
   import _14193._14196;
   import _14193._14197;
   import _14201.SVG;
   import _14201._14202;
   import _14201._14203;
   import _14201._14204;
   import _14201._14205;
   import _14201._14206;
   import _14201._14207;
   import _14201._14208;
   import _14201._14209;
   import _14201._14210;
   import _14201._14211;
   import _14201._14212;
   import _14201._14213;
   import _14201._14214;
   import _14201._14215;
   import _14201._14216;
   import _14201._14217;
   import _14201._14218;
   import _14201._14219;
   import _14201._14220;
   import _14201._14221;
   import _14240.StringUtil;
   import _14240._14245;
   import _14240._14246;
   import flash.display.GradientType;
   import flash.display.SpreadMethod;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   
   public class _14230 extends EventDispatcher
   {
      protected namespace svg = "http://www.w3.org/2000/svg";
      
      private var _15470:Vector.<_14233>;
      
      private var _svg:XML;
      
      private var _target:_14205;
      
      private var _10427:_14162;
      
      public function _14230(param1:_14205, param2:XML)
      {
         super();
         this._target = param1;
         this._svg = param2;
      }
      
      public function parse() : void
      {
         this._15472(this._svg);
         this._15457(this._svg);
         this._15464(this._svg);
         this._15470 = new Vector.<_14233>();
         this._15470.push(new _14233(this._svg,function(param1:_14197):void
         {
            _target.addElement(param1);
         }));
         this._10427 = new _14162(null,this._15151,this.parseComplete);
         this._10427.start();
      }
      
      public function cancel() : void
      {
         this._10427.stop();
         this._10427 = null;
      }
      
      private function _15151() : int
      {
         this._15470.unshift.apply(this,this._15486(this._15470.shift()));
         return this._15470.length == 0 ? _14162.COMPLETE : _14162.CONTINUE;
      }
      
      private function parseComplete() : void
      {
         dispatchEvent(new Event(Event.COMPLETE));
         this._10427 = null;
      }
      
      private function _15486(param1:_14233) : Array
      {
         var obj:Object = null;
         var localName:String = null;
         var element:_14197 = null;
         var container:_14196 = null;
         var childElt:XML = null;
         var visitDefinition:_14233 = param1;
         var childVisits:Array = [];
         var elt:XML = visitDefinition.node;
         if(elt.nodeKind() == "text")
         {
            obj = elt.toString();
         }
         else if(elt.nodeKind() == "element")
         {
            localName = String(elt.localName()).toLowerCase();
            switch(localName)
            {
               case "svg":
                  obj = this._15482(elt);
                  break;
               case "defs":
                  this._15481(elt,childVisits);
                  break;
               case "rect":
                  obj = this._15480(elt);
                  break;
               case "path":
                  obj = this._15478(elt);
                  break;
               case "polygon":
                  obj = this._15462(elt);
                  break;
               case "polyline":
                  obj = this._15461(elt);
                  break;
               case "line":
                  obj = this._15479(elt);
                  break;
               case "circle":
                  obj = this._15467(elt);
                  break;
               case "ellipse":
                  obj = this._15463(elt);
                  break;
               case "g":
                  obj = this._15484(elt);
                  break;
               case "clippath":
                  obj = this._15460(elt);
                  break;
               case "symbol":
                  obj = this._15468(elt);
                  break;
               case "marker":
                  obj = this._15469(elt);
                  break;
               case "mask":
                  obj = this._15476(elt);
                  break;
               case "text":
                  obj = this._15477(elt,childVisits);
                  break;
               case "tspan":
                  obj = this._15474(elt,childVisits);
                  break;
               case "image":
                  obj = this._15475(elt);
                  break;
               case "a":
                  obj = this._15485(elt);
                  break;
               case "use":
                  obj = this._15483(elt);
                  break;
               case "pattern":
                  obj = this._15465(elt);
                  break;
               case "switch":
                  obj = this._15473(elt);
            }
         }
         if(obj is _14197)
         {
            element = obj as _14197;
            element.id = elt.@id;
            element.metadata = elt.metadata[0];
            if(element.id != null && element.id != "")
            {
               this._target._15346(element.id,element);
            }
            _14246._15453(elt,element.style);
            if("@style" in elt)
            {
               element.style.fromString(elt.@style);
            }
            if("@class" in elt)
            {
               element._15262 = String(elt["@class"]);
            }
            if("@transform" in elt)
            {
               element._15249 = String(elt.@transform);
            }
            if("@clip-path" in elt)
            {
               element._15255 = String(elt["@clip-path"]);
            }
            if("@mask" in elt)
            {
               element._15264 = String(elt.@mask);
            }
            if(element is _14192)
            {
               (element as _14192)._15189 = "@preserveAspectRatio" in elt ? elt.@preserveAspectRatio : null;
            }
            if(element is _14194)
            {
               (element as _14194)._15190 = _14232._15466(elt.@viewBox);
            }
            if(element is _14196)
            {
               container = element as _14196;
               for each(childElt in elt.elements())
               {
                  childVisits.push(new _14233(childElt,function(param1:_14197):void
                  {
                     if(param1)
                     {
                        container.addElement(param1);
                     }
                  }));
               }
            }
         }
         if(visitDefinition.onComplete != null)
         {
            visitDefinition.onComplete(obj);
         }
         return childVisits;
      }
      
      private function _15482(param1:XML) : SVG
      {
         var _loc2_:SVG = new SVG();
         _loc2_._15196 = "@x" in param1 ? param1.@x : null;
         _loc2_._15197 = "@y" in param1 ? param1.@y : null;
         _loc2_._15195 = "@width" in param1 ? param1.@width : "100%";
         _loc2_._15194 = "@height" in param1 ? param1.@height : "100%";
         return _loc2_;
      }
      
      private function _15481(param1:XML, param2:Array) : void
      {
         var _loc3_:XML = null;
         for each(_loc3_ in param1.*)
         {
            param2.push(new _14233(_loc3_));
         }
      }
      
      private function _15480(param1:XML) : _14216
      {
         var _loc2_:_14216 = new _14216();
         _loc2_._15196 = param1.@x;
         _loc2_._15197 = param1.@y;
         _loc2_._15195 = param1.@width;
         _loc2_._15194 = param1.@height;
         _loc2_._15358 = param1.@_14639;
         _loc2_._15357 = param1.@_14638;
         return _loc2_;
      }
      
      private function _15478(param1:XML) : _14212
      {
         var _loc2_:_14212 = new _14212();
         _loc2_.path = _14232._15387(param1.@d);
         return _loc2_;
      }
      
      private function _15462(param1:XML) : _14214
      {
         var _loc2_:_14214 = new _14214();
         _loc2_.points = _14232._15273(param1.@points);
         return _loc2_;
      }
      
      private function _15461(param1:XML) : _14215
      {
         var _loc2_:_14215 = new _14215();
         _loc2_.points = _14232._15273(param1.@points);
         return _loc2_;
      }
      
      private function _15479(param1:XML) : _14209
      {
         var _loc2_:_14209 = new _14209();
         _loc2_._15374 = param1.@x1;
         _loc2_._15376 = param1.@y1;
         _loc2_._15375 = param1.@x2;
         _loc2_._15377 = param1.@y2;
         return _loc2_;
      }
      
      private function _15467(param1:XML) : _14203
      {
         var _loc2_:_14203 = new _14203();
         _loc2_._15322 = param1.@cx;
         _loc2_._15323 = param1.@cy;
         _loc2_._15326 = param1.@r;
         return _loc2_;
      }
      
      private function _15463(param1:XML) : _14206
      {
         var _loc2_:_14206 = new _14206();
         _loc2_._15322 = param1.@cx;
         _loc2_._15323 = param1.@cy;
         _loc2_._15358 = param1.@_14639;
         _loc2_._15357 = param1.@_14638;
         return _loc2_;
      }
      
      private function _15484(param1:XML) : _14207
      {
         return new _14207();
      }
      
      private function _15485(param1:XML) : _14202
      {
         var _loc2_:_14202 = new _14202();
         var _loc3_:Namespace = new Namespace("http://www.w3.org/1999/xlink");
         var _loc4_:String = param1._loc3_::@href;
         _loc4_ = StringUtil.ltrim(_loc4_,"#");
         _loc2_._15316 = _loc4_;
         return _loc2_;
      }
      
      private function _15460(param1:XML) : _14204
      {
         return new _14204();
      }
      
      private function _15468(param1:XML) : _14218
      {
         return new _14218();
      }
      
      private function _15469(param1:XML) : _14210
      {
         var _loc2_:_14210 = new _14210();
         _loc2_._15385 = param1.@refX;
         _loc2_._15384 = param1.@refY;
         _loc2_._15381 = param1.@markerWidth;
         _loc2_._15380 = param1.@markerHeight;
         _loc2_._15383 = param1.@orient;
         return _loc2_;
      }
      
      private function _15476(param1:XML) : _14211
      {
         return new _14211();
      }
      
      private function _15477(param1:XML, param2:Array) : _14219
      {
         var obj:_14219 = null;
         var numChildrenToVisit:int = 0;
         var visitNumber:int = 0;
         var childElt:XML = null;
         var elt:XML = param1;
         var childVisits:Array = param2;
         obj = new _14219();
         obj._15196 = "@x" in elt ? elt.@x : "0";
         obj._15197 = "@y" in elt ? elt.@y : "0";
         numChildrenToVisit = 0;
         visitNumber = 0;
         for each(childElt in elt.*)
         {
            numChildrenToVisit++;
            childVisits.push(new _14233(childElt,function(param1:Object):void
            {
               var _loc2_:* = undefined;
               if(param1)
               {
                  if(param1 is String)
                  {
                     _loc2_ = param1 as String;
                     _loc2_ = _14246._15458(_loc2_);
                     if(visitNumber == 0)
                     {
                        _loc2_ = StringUtil.ltrim(_loc2_);
                     }
                     else if(visitNumber == numChildrenToVisit - 1)
                     {
                        _loc2_ = StringUtil.rtrim(_loc2_);
                     }
                     if(StringUtil.trim(_loc2_) != "")
                     {
                        obj._15305(_loc2_);
                     }
                  }
                  else
                  {
                     obj._15305(param1);
                  }
               }
               ++visitNumber;
            }));
         }
         return obj;
      }
      
      private function _15474(param1:XML, param2:Array) : _14220
      {
         var numChildrenToVisit:int;
         var visitNumber:int;
         var obj:_14220 = null;
         var childElt:XML = null;
         var elt:XML = param1;
         var childVisits:Array = param2;
         obj = new _14220();
         obj._15196 = "@x" in elt ? elt.@x : null;
         obj._15197 = "@y" in elt ? elt.@y : null;
         obj._15401 = "@dx" in elt ? elt.@dx : "0";
         obj._15402 = "@dy" in elt ? elt.@dy : "0";
         numChildrenToVisit = 0;
         visitNumber = 0;
         for each(childElt in elt.*)
         {
            numChildrenToVisit++;
            childVisits.push(new _14233(childElt,function(param1:Object):void
            {
               var _loc2_:* = undefined;
               if(param1)
               {
                  if(param1 is String)
                  {
                     _loc2_ = param1 as String;
                     _loc2_ = _14246._15458(_loc2_);
                     if(StringUtil.trim(_loc2_) != "")
                     {
                        obj._15305(_loc2_);
                     }
                  }
                  else
                  {
                     obj._15305(param1);
                  }
               }
               ++visitNumber;
            }));
         }
         return obj;
      }
      
      private function _15475(param1:XML) : _14208
      {
         var _loc2_:_14208 = new _14208();
         _loc2_._15196 = "@x" in param1 ? param1.@x : null;
         _loc2_._15197 = "@y" in param1 ? param1.@y : null;
         _loc2_._15195 = "@width" in param1 ? param1.@width : null;
         _loc2_._15194 = "@height" in param1 ? param1.@height : null;
         var _loc3_:Namespace = new Namespace("http://www.w3.org/1999/xlink");
         var _loc4_:String = param1._loc3_::@href;
         _loc2_._15316 = StringUtil.trim(_loc4_);
         return _loc2_;
      }
      
      private function _15483(param1:XML) : _14221
      {
         var _loc2_:_14221 = new _14221();
         _loc2_._15196 = "@x" in param1 ? param1.@x : null;
         _loc2_._15197 = "@y" in param1 ? param1.@y : null;
         _loc2_._15195 = "@width" in param1 ? param1.@width : null;
         _loc2_._15194 = "@height" in param1 ? param1.@height : null;
         var _loc3_:Namespace = new Namespace("http://www.w3.org/1999/xlink");
         var _loc4_:String = param1._loc3_::@href;
         _loc2_._15316 = StringUtil.trim(_loc4_);
         return _loc2_;
      }
      
      private function _15465(param1:XML) : _14213
      {
         var _loc2_:_14213 = new _14213();
         _loc2_._15196 = "@x" in param1 ? param1.@x : null;
         _loc2_._15197 = "@y" in param1 ? param1.@y : null;
         _loc2_._15195 = "@width" in param1 ? param1.@width : null;
         _loc2_._15194 = "@height" in param1 ? param1.@height : null;
         _loc2_.patternTransform = "@patternTransform" in param1 ? param1.@patternTransform : null;
         return _loc2_;
      }
      
      private function _15473(param1:XML) : _14217
      {
         return new _14217();
      }
      
      private function _15472(param1:XML) : void
      {
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:Array = null;
         var _loc6_:String = null;
         var _loc7_:Array = null;
         var _loc8_:Array = null;
         var _loc9_:String = null;
         var _loc10_:String = null;
         var _loc2_:XMLList = param1..style.text();
         for each(_loc3_ in _loc2_)
         {
            _loc4_ = _14246._15458(_loc3_);
            _loc5_ = _loc4_.split("}");
            for each(_loc6_ in _loc5_)
            {
               _loc6_ = StringUtil.trim(_loc6_);
               if(_loc6_.indexOf("{") > -1)
               {
                  _loc7_ = _loc6_.split("{");
                  _loc8_ = StringUtil.trim(_loc7_[0]).split(" ");
                  for each(_loc9_ in _loc8_)
                  {
                     _loc10_ = StringUtil.trim(_loc7_[1]);
                     this._target._15335(_loc9_,_14187._15182(_loc10_));
                  }
               }
            }
         }
      }
      
      private function _15457(param1:XML) : void
      {
         var nodes:XMLList = null;
         var node:XML = null;
         var svg:XML = param1;
         try
         {
            nodes = svg..*.(localName().toLowerCase() == "lineargradient" || localName().toLowerCase() == "radialgradient");
            for each(node in nodes)
            {
               this._15459(node.@id,svg);
            }
         }
         catch(e:Error)
         {
         }
      }
      
      private function _15459(param1:String, param2:XML) : _14168
      {
         var xml_grad:XML;
         var grad:_14168 = null;
         var xlink:Namespace = null;
         var stop:XML = null;
         var baseGradient:_14168 = null;
         var linearGrad:_14170 = null;
         var radialGrad:_14171 = null;
         var stopStyle:_14187 = null;
         var offset:Number = NaN;
         var id:String = param1;
         var svg:XML = param2;
         id = StringUtil.ltrim(id,"#");
         if(this._target.hasDefinition(id))
         {
            return this._target.getDefinition(id) as _14168;
         }
         xml_grad = svg..*.(attribute("id") == id)[0];
         if(xml_grad == null)
         {
            return null;
         }
         switch(xml_grad.localName().toLowerCase())
         {
            case "lineargradient":
               grad = new _14170();
               break;
            case "radialgradient":
               grad = new _14171();
         }
         xlink = new Namespace("http://www.w3.org/1999/xlink");
         if(xml_grad.xlink::@href.length() > 0)
         {
            baseGradient = this._15459(xml_grad.xlink::@href,svg);
            if(baseGradient)
            {
               baseGradient.copyTo(grad);
            }
         }
         if("@gradientUnits" in xml_grad)
         {
            grad.gradientUnits = xml_grad.@gradientUnits;
         }
         else
         {
            grad.gradientUnits = "objectBoundingBox";
         }
         if("@gradientTransform" in xml_grad)
         {
            grad.transform = _14232._15220(xml_grad.@gradientTransform);
         }
         switch(grad.type)
         {
            case GradientType.LINEAR:
               linearGrad = grad as _14170;
               if("@x1" in xml_grad)
               {
                  linearGrad.x1 = xml_grad.@x1;
               }
               else if(linearGrad.x1 == null)
               {
                  linearGrad.x1 = "0%";
               }
               if("@y1" in xml_grad)
               {
                  linearGrad.y1 = xml_grad.@y1;
               }
               else if(linearGrad.y1 == null)
               {
                  linearGrad.y1 = "0%";
               }
               if("@x2" in xml_grad)
               {
                  linearGrad.x2 = xml_grad.@x2;
               }
               else if(linearGrad.x2 == null)
               {
                  linearGrad.x2 = "100%";
               }
               if("@y2" in xml_grad)
               {
                  linearGrad.y2 = xml_grad.@y2;
               }
               else if(linearGrad.y2 == null)
               {
                  linearGrad.y2 = "0%";
               }
               break;
            case GradientType.RADIAL:
               radialGrad = grad as _14171;
               if("@cx" in xml_grad)
               {
                  radialGrad.cx = xml_grad.@cx;
               }
               else if(radialGrad.cx == null)
               {
                  radialGrad.cx = "50%";
               }
               if("@cy" in xml_grad)
               {
                  radialGrad.cy = xml_grad.@cy;
               }
               else if(radialGrad.cy == null)
               {
                  radialGrad.cy = "50%";
               }
               if("@r" in xml_grad)
               {
                  radialGrad.r = xml_grad.@r;
               }
               else if(radialGrad.r == null)
               {
                  radialGrad.r = "50%";
               }
               if("@fx" in xml_grad)
               {
                  radialGrad.fx = xml_grad.@fx;
               }
               else if(radialGrad.fx == null)
               {
                  radialGrad.fx = radialGrad.cx;
               }
               if("@fy" in xml_grad)
               {
                  radialGrad.fy = xml_grad.@fy;
               }
               else if(radialGrad.fy == null)
               {
                  radialGrad.fy = radialGrad.cy;
               }
         }
         switch(xml_grad.@spreadMethod)
         {
            case "pad":
               grad.spreadMethod = SpreadMethod.PAD;
               break;
            case "reflect":
               grad.spreadMethod = SpreadMethod.REFLECT;
               break;
            case "repeat":
               grad.spreadMethod = SpreadMethod.REPEAT;
               break;
            default:
               grad.spreadMethod = SpreadMethod.PAD;
         }
         if(grad.colors == null)
         {
            grad.colors = new Array();
         }
         if(grad.alphas == null)
         {
            grad.alphas = new Array();
         }
         if(grad.ratios == null)
         {
            grad.ratios = new Array();
         }
         for each(stop in xml_grad.stop)
         {
            stopStyle = new _14187();
            if("@stop-opacity" in stop)
            {
               stopStyle.setProperty("stop-opacity",stop["stop-opacity"]);
            }
            if("@stop-color" in stop)
            {
               stopStyle.setProperty("stop-color",stop["stop-color"]);
            }
            if("@style" in stop)
            {
               stopStyle.fromString(stop.@style);
            }
            grad.colors.push(_14245._15276(stopStyle._15181("stop-color")));
            grad.alphas.push(stopStyle._15181("stop-opacity") != null ? Number(stopStyle._15181("stop-opacity")) : 1);
            offset = Number(StringUtil.rtrim(stop.@offset,"%"));
            if(String(stop.@offset).indexOf("%") > -1)
            {
               offset /= 100;
            }
            grad.ratios.push(offset * 255);
         }
         this._target._15346(id,grad);
         return grad;
      }
      
      private function _15464(param1:XML) : void
      {
         var nodes:XMLList = null;
         var node:XML = null;
         var svg:XML = param1;
         try
         {
            nodes = svg..*.(localName().toLowerCase() == "filter");
            for each(node in nodes)
            {
               this._15456(node);
            }
         }
         catch(e:Error)
         {
         }
      }
      
      private function _15456(param1:XML) : void
      {
         var _loc3_:XML = null;
         var _loc4_:String = null;
         var _loc5_:_14163 = null;
         var _loc2_:_14166 = new _14166();
         for each(_loc3_ in param1.elements())
         {
            _loc5_ = this._15471(_loc3_);
            if(_loc5_)
            {
               _loc2_._15171.push(_loc5_);
            }
         }
         _loc4_ = StringUtil.ltrim(param1.@id,"#");
         this._target._15346(_loc4_,_loc2_);
      }
      
      private function _15471(param1:XML) : _14163
      {
         var _loc2_:String = String(param1.localName()).toLowerCase();
         switch(_loc2_)
         {
            case "fegaussianblur":
               return this._15454(param1);
            case "fecolormatrix":
               return this._15455(param1);
            default:
               return null;
         }
      }
      
      private function _15454(param1:XML) : _14167
      {
         var _loc3_:Array = null;
         var _loc2_:_14167 = new _14167();
         if("@stdDeviation" in param1)
         {
            _loc3_ = String(param1.@stdDeviation).split(/\s,/);
            _loc2_._15173 = Number(_loc3_[0]);
            _loc2_._15172 = _loc3_.length > 1 ? Number(_loc3_[1]) : Number(_loc3_[0]);
         }
         return _loc2_;
      }
      
      private function _15455(param1:XML) : _14165
      {
         var _loc5_:String = null;
         var _loc2_:_14165 = new _14165();
         _loc2_.type = "@type" in param1 ? param1.@type : "matrix";
         var _loc3_:String = "@values" in param1 ? param1.@values : "";
         var _loc4_:Array = [];
         for each(_loc5_ in _14232._15273(_loc3_))
         {
            _loc4_.push(Number(_loc5_));
         }
         _loc2_.values = _loc4_;
         return _loc2_;
      }
   }
}

