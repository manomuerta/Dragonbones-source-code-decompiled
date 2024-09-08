package _724
{
   import com.codeazur.as3swf.SWF;
   import com.codeazur.as3swf.SWFTimelineContainer;
   import com.codeazur.as3swf.events.SWFErrorEvent;
   import com.codeazur.as3swf.events.SWFProgressEvent;
   import com.codeazur.as3swf.exporters._14137;
   import com.codeazur.as3swf.tags.IDefinitionTag;
   import com.codeazur.as3swf.tags.ITag;
   import com.codeazur.as3swf.tags.TagDefineBits;
   import com.codeazur.as3swf.tags.TagDefineBitsJPEG2;
   import com.codeazur.as3swf.tags.TagDefineBitsJPEG3;
   import com.codeazur.as3swf.tags.TagDefineBitsJPEG4;
   import com.codeazur.as3swf.tags.TagDefineBitsLossless;
   import com.codeazur.as3swf.tags.TagDefineBitsLossless2;
   import com.codeazur.as3swf.tags.TagDefineShape;
   import com.codeazur.as3swf.tags.TagDefineShape2;
   import com.codeazur.as3swf.tags.TagDefineShape3;
   import com.codeazur.as3swf.tags.TagDefineShape4;
   import com.codeazur.as3swf.tags.TagDefineSprite;
   import com.codeazur.as3swf.tags.TagPlaceObject;
   import com.codeazur.as3swf.timeline.Frame;
   import com.codeazur.as3swf.timeline.FrameObject;
   import egret.core._1141;
   import egret.core.ns_egret;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.geom.Matrix;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   
   use namespace ns_egret;
   
   public class _14088
   {
      public static var _14734:Boolean = false;
      
      private var swf:SWF;
      
      public var _1748:Object;
      
      private var _14731:Dictionary;
      
      private var _14737:Dictionary;
      
      private var _14736:Dictionary;
      
      private var _14738:Vector.<IDefinitionTag>;
      
      private var _14725:int = 0;
      
      public var _14700:Function = null;
      
      public var _14701:Function = null;
      
      private var extension:String;
      
      public function _14088()
      {
         this._1748 = {};
         super();
         this._14737 = new Dictionary();
         this._14731 = new Dictionary();
         this._14736 = new Dictionary();
         this._14738 = new Vector.<IDefinitionTag>();
      }
      
      public function convert(param1:ByteArray, param2:String) : void
      {
         this.extension = param2;
         if(this.swf)
         {
            this.swf.removeEventListener(SWFProgressEvent.PROGRESS,this._14714);
            this.swf.removeEventListener(SWFProgressEvent.COMPLETE,this._14715);
            this.swf.removeEventListener(SWFErrorEvent.ERROR,this._14717);
         }
         this.swf = new SWF();
         this.swf.addEventListener(SWFProgressEvent.PROGRESS,this._14714);
         this.swf.addEventListener(SWFProgressEvent.COMPLETE,this._14715);
         this.swf.addEventListener(SWFErrorEvent.ERROR,this._14717);
         SWFTimelineContainer.TIMEOUT = 20;
         this.swf.loadBytesAsync(param1);
      }
      
      protected function _14714(param1:SWFProgressEvent) : void
      {
      }
      
      protected function _14715(param1:SWFProgressEvent) : void
      {
         _1141.ns_egret::stage.addEventListener(Event.ENTER_FRAME,this._14716);
      }
      
      protected function _14717(param1:SWFErrorEvent) : void
      {
         if(this._14701 != null)
         {
            this._14701.call(null);
         }
      }
      
      private function _14716(param1:Event) : void
      {
         _1141.ns_egret::stage.removeEventListener(Event.ENTER_FRAME,this._14716);
         if(this.extension == _14086.SWF)
         {
            this._14723();
         }
         this._14732();
      }
      
      private function _14723() : void
      {
         var _loc2_:FrameObject = null;
         var _loc3_:TagPlaceObject = null;
         var _loc4_:Object = null;
         this._1748 = {};
         var _loc1_:Frame = this.swf.frames[0];
         for each(_loc2_ in _loc1_.objects)
         {
            _loc3_ = _loc2_._14730;
            if(_loc3_.instanceName)
            {
               (_loc4_ = new Object()).instanceName = _loc3_.instanceName;
               _loc4_.characterId = _loc3_.characterId;
               this._1748[_loc4_.instanceName] = _loc4_;
            }
         }
      }
      
      private function _14732() : void
      {
         var _loc1_:ITag = null;
         var _loc2_:int = 0;
         var _loc6_:TagDefineSprite = null;
         var _loc3_:Boolean = false;
         var _loc4_:int = getTimer();
         var _loc5_:int = int(this.swf.tags.length);
         while(this._14725 < this.swf.tags.length)
         {
            _loc1_ = this.swf.tags[this._14725];
            if(!(_loc1_ is IDefinitionTag))
            {
               ++this._14725;
            }
            else
            {
               switch(_loc1_.type)
               {
                  case TagDefineBits.TYPE:
                  case TagDefineBitsJPEG2.TYPE:
                  case TagDefineBitsJPEG3.TYPE:
                  case TagDefineBitsJPEG4.TYPE:
                  case TagDefineBitsLossless.TYPE:
                  case TagDefineBitsLossless2.TYPE:
                     this._14738.push(_loc1_);
                     break;
                  case TagDefineShape.TYPE:
                  case TagDefineShape2.TYPE:
                  case TagDefineShape3.TYPE:
                  case TagDefineShape4.TYPE:
                     this._14726(_loc1_ as TagDefineShape);
                     break;
                  case TagDefineSprite.TYPE:
                     _loc6_ = _loc1_ as TagDefineSprite;
                     this._14724(_loc6_.frames,_loc6_.characterId,_loc6_._14729,_loc6_._14728);
               }
               ++this._14725;
               if(getTimer() - _loc4_ > 40)
               {
                  _loc3_ = true;
                  break;
               }
            }
         }
         if(this._14725 > _loc5_ - 1 && this._14700 != null)
         {
            this._14700.call(null);
            return;
         }
         if(_loc3_)
         {
            _1141.ns_egret::stage.addEventListener(Event.ENTER_FRAME,this._14716);
         }
      }
      
      private function _14733(param1:Dictionary) : Array
      {
         var _loc3_:String = null;
         var _loc2_:Array = [];
         for(_loc3_ in param1)
         {
            _loc2_.push(param1[_loc3_]);
         }
         _loc2_.sortOn("depth",Array.NUMERIC);
         return _loc2_;
      }
      
      public function _14709(param1:String) : MovieClip
      {
         var _loc3_:MovieClip = null;
         var _loc4_:Object = null;
         var _loc5_:Array = null;
         var _loc6_:Array = null;
         var _loc7_:TagPlaceObject = null;
         var _loc8_:Matrix = null;
         var _loc9_:MovieClip = null;
         var _loc2_:Boolean = false;
         for each(_loc4_ in this._1748)
         {
            if(param1 == _loc4_.instanceName)
            {
               _loc5_ = [];
               _loc6_ = this._14719(_loc4_.characterId);
               if(_loc6_)
               {
                  _loc7_ = this._14722(_loc4_.characterId);
                  _loc8_ = _loc7_.matrix.matrix;
                  _loc8_.tx /= 20;
                  _loc8_.ty /= 20;
                  if(!_loc2_)
                  {
                     _loc3_ = new MovieClip();
                     this._14735(_loc3_,_loc6_);
                     _loc3_.transform.matrix = _loc8_;
                     _loc2_ = true;
                  }
                  else
                  {
                     _loc9_ = new MovieClip();
                     this._14735(_loc9_,_loc6_);
                     _loc3_.addChild(_loc9_);
                     _loc9_.transform.matrix = _loc8_;
                  }
               }
            }
         }
         return _loc3_;
      }
      
      public function _14704(param1:String = "") : MovieClip
      {
         var _loc3_:MovieClip = null;
         var _loc5_:Object = null;
         var _loc6_:Array = null;
         var _loc7_:int = 0;
         var _loc8_:TagPlaceObject = null;
         var _loc9_:Array = null;
         var _loc10_:Matrix = null;
         var _loc11_:MovieClip = null;
         var _loc2_:Boolean = false;
         var _loc4_:Array = [];
         for each(_loc5_ in this._14731)
         {
            _loc4_ = this._14718(param1,_loc5_);
            if(_loc4_)
            {
               _loc6_ = [];
               _loc7_ = 0;
               while(_loc7_ < _loc4_.length)
               {
                  _loc8_ = _loc4_[_loc7_];
                  _loc9_ = this._14719(_loc8_.characterId);
                  if(_loc9_)
                  {
                     _loc10_ = _loc8_.matrix.matrix;
                     _loc10_.tx /= 20;
                     _loc10_.ty /= 20;
                     if(!_loc2_)
                     {
                        _loc3_ = new MovieClip();
                        this._14735(_loc3_,_loc9_);
                        _loc3_.transform.matrix = _loc10_;
                        _loc2_ = true;
                     }
                     else
                     {
                        _loc11_ = new MovieClip();
                        this._14735(_loc11_,_loc9_);
                        _loc3_.addChild(_loc11_);
                        _loc11_.transform.matrix = _loc10_;
                     }
                  }
                  _loc7_++;
               }
               break;
            }
         }
         return _loc3_;
      }
      
      private function _14727(param1:Array) : Array
      {
         var _loc2_:Array = [];
         var _loc3_:int = int(param1.length);
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(param1[_loc4_][0] == "beginBitmapFill" || param1[_loc4_][0] == "lineBitmapStyle")
            {
               _loc2_.push(param1[_loc4_][1][0]);
            }
            _loc4_++;
         }
         return _loc2_;
      }
      
      private function _14735(param1:Sprite, param2:Array) : void
      {
         var counted:int = 0;
         var cacheIds:Array = null;
         var i:int = 0;
         var id:int = 0;
         var mc:Sprite = param1;
         var cmds:Array = param2;
         var draw:Function = function():void
         {
            var _loc3_:Array = null;
            var _loc1_:int = int(cmds.length);
            mc.graphics.clear();
            var _loc2_:int = 0;
            while(_loc2_ < _loc1_)
            {
               _loc3_ = cmds[_loc2_];
               switch(_loc3_[0])
               {
                  case "beginFill":
                     mc.graphics.beginFill.apply(null,_loc3_[1]);
                     break;
                  case "beginBitmapFill":
                     mc.graphics.beginBitmapFill(_14736[_loc3_[1][0]],_loc3_[1][1],_loc3_[1][2],_loc3_[1][3]);
                     break;
                  case "beginGradientFill":
                     mc.graphics.beginGradientFill.apply(null,_loc3_[1]);
                     break;
                  case "endFill":
                     mc.graphics.endFill.apply(null);
                     break;
                  case "moveTo":
                     mc.graphics.moveTo.apply(null,_loc3_[1]);
                     break;
                  case "curveTo":
                     mc.graphics.curveTo.apply(null,_loc3_[1]);
                     break;
                  case "lineTo":
                     mc.graphics.lineTo.apply(null,_loc3_[1]);
                     break;
                  case "lineStyle":
                     mc.graphics.lineStyle.apply(null,_loc3_[1]);
                     break;
                  case "lineBitmapStyle":
                     mc.graphics.lineBitmapStyle(_14736[_loc3_[1][0]],_loc3_[1][1],_loc3_[1][2],_loc3_[1][3]);
                     break;
                  case "lineGradientStyle":
                     mc.graphics.lineGradientStyle.apply(null,_loc3_[1]);
                     break;
                  case "endShape":
                     break;
               }
               _loc2_++;
            }
         };
         counted = 0;
         cacheIds = this._14727(cmds);
         if(cacheIds.length > 0)
         {
            i = 0;
            while(i < cacheIds.length)
            {
               id = int(cacheIds[i]);
               this._14720(id,function complete(param1:BitmapData):void
               {
                  _14736[id] = param1;
                  ++counted;
                  if(counted == cacheIds.length)
                  {
                     draw();
                  }
               });
               i++;
            }
         }
         else
         {
            draw();
         }
      }
      
      private function _14720(param1:int, param2:Function) : void
      {
         var _14330:BitmapData = null;
         var tagBit:TagDefineBits = null;
         var tagBitLossLess:TagDefineBitsLossless = null;
         var _id:int = param1;
         var complete:Function = param2;
         var i:int = 0;
         while(i < this._14738.length)
         {
            _14330 = new BitmapData(1,1);
            if(this._14738[i] is TagDefineBits)
            {
               tagBit = this._14738[i] as TagDefineBits;
            }
            else if(this._14738[i] is TagDefineBitsLossless)
            {
               tagBitLossLess = this._14738[i] as TagDefineBitsLossless;
            }
            if(Boolean(tagBit) && tagBit.characterId == _id)
            {
               tagBit.exportBitmapData(function(param1:BitmapData, param2:TagDefineBits):void
               {
                  _14330 = param1;
                  complete.call(null,_14330);
               },this.swf.jpegTablesTag);
               return;
            }
            if(Boolean(tagBitLossLess) && tagBitLossLess.characterId == _id)
            {
               tagBitLossLess.exportBitmapData();
               _14330 = tagBitLossLess.bmpData;
               complete.call(null,_14330);
               return;
            }
            i++;
         }
      }
      
      private function _14719(param1:int) : Array
      {
         var _loc2_:Object = this._14731[param1];
         if(!_loc2_)
         {
            if(this._14737[param1])
            {
               return this._14737[param1];
            }
         }
         if(!_loc2_)
         {
            return null;
         }
         var _loc3_:Array = _loc2_.frames;
         if(_loc3_.length == 0)
         {
            return null;
         }
         var _loc4_:TagPlaceObject = _loc2_.frames[0][0] as TagPlaceObject;
         return this._14737[_loc4_.characterId];
      }
      
      private function _14722(param1:int) : TagPlaceObject
      {
         var _loc2_:Object = this._14731[param1];
         if(!_loc2_)
         {
            if(this._14737[param1])
            {
               return this._14737[param1];
            }
         }
         if(!_loc2_)
         {
            return null;
         }
         var _loc3_:Array = _loc2_.frames;
         if(_loc3_.length == 0)
         {
            return null;
         }
         return _loc2_.frames[0][0] as TagPlaceObject;
      }
      
      private function _14718(param1:String, param2:Object) : Array
      {
         var _loc7_:int = 0;
         var _loc8_:Array = null;
         var _loc9_:int = 0;
         var _loc3_:Array = param2.frames;
         var _loc4_:Array = param2.labels;
         var _loc5_:Array = [];
         var _loc6_:int = int(_loc4_.length);
         while(_loc7_ < _loc6_)
         {
            _loc8_ = _loc4_[_loc7_];
            _loc9_ = 0;
            while(_loc9_ < _loc8_.length)
            {
               if(_loc8_[_loc9_] == param1)
               {
                  return _loc3_[_loc7_];
               }
               _loc9_++;
            }
            _loc7_++;
         }
         return null;
      }
      
      private function _14726(param1:TagDefineShape) : void
      {
         var cmd:Array = null;
         var exporterComplete:Function = null;
         var tag:TagDefineShape = param1;
         exporterComplete = function(param1:int, param2:Array):void
         {
            _14737[param1] = param2;
         };
         var exporter:_14137 = new _14137(tag,this.swf);
         exporter._14721 = exporterComplete;
         tag.export(exporter);
      }
      
      private function _14724(param1:Vector.<Frame>, param2:uint = 0, param3:Dictionary = null, param4:Dictionary = null) : void
      {
         var _loc6_:Dictionary = null;
         var _loc7_:TagPlaceObject = null;
         var _loc10_:Array = null;
         var _loc11_:int = 0;
         var _loc5_:Object;
         (_loc5_ = new Object()).frames = [];
         _loc5_.labels = [];
         var _loc8_:Array = [];
         _loc5_.characterId = param2;
         var _loc9_:int = 0;
         while(_loc9_ < param1.length)
         {
            _loc8_.length = 0;
            _loc6_ = param1[_loc9_].objects;
            _loc5_.frames[_loc9_] = [];
            _loc5_.labels[_loc9_] = [];
            _loc10_ = this._14733(_loc6_);
            _loc11_ = 0;
            while(_loc11_ < _loc10_.length)
            {
               _loc7_ = _loc6_[_loc10_[_loc11_].depth]._14730;
               if(_loc7_)
               {
                  _loc5_.frames[_loc9_].push(_loc7_);
               }
               _loc11_++;
            }
            if(param1[_loc9_].labels)
            {
               _loc5_.labels[_loc9_] = param1[_loc9_].labels;
            }
            _loc9_++;
         }
         this._14731[param2] = _loc5_;
      }
   }
}

