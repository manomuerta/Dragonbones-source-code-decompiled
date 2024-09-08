package com.codeazur.as3swf
{
   import _14144.Config;
   import com.codeazur.as3swf.data.SWFButtonRecord;
   import com.codeazur.as3swf.data.SWFFrameLabel;
   import com.codeazur.as3swf.data.SWFRawTag;
   import com.codeazur.as3swf.data.SWFRecordHeader;
   import com.codeazur.as3swf.data.SWFScene;
   import com.codeazur.as3swf.data.consts.SoundCompression;
   import com.codeazur.as3swf.events.SWFErrorEvent;
   import com.codeazur.as3swf.events.SWFEventDispatcher;
   import com.codeazur.as3swf.events.SWFProgressEvent;
   import com.codeazur.as3swf.events.SWFWarningEvent;
   import com.codeazur.as3swf.factories.ISWFTagFactory;
   import com.codeazur.as3swf.factories.SWFTagFactory;
   import com.codeazur.as3swf.tags.IDefinitionTag;
   import com.codeazur.as3swf.tags.IDisplayListTag;
   import com.codeazur.as3swf.tags.ITag;
   import com.codeazur.as3swf.tags.TagDefineButton;
   import com.codeazur.as3swf.tags.TagDefineButton2;
   import com.codeazur.as3swf.tags.TagDefineMorphShape;
   import com.codeazur.as3swf.tags.TagDefineSceneAndFrameLabelData;
   import com.codeazur.as3swf.tags.TagDefineShape;
   import com.codeazur.as3swf.tags.TagDefineSprite;
   import com.codeazur.as3swf.tags.TagEnd;
   import com.codeazur.as3swf.tags.TagFrameLabel;
   import com.codeazur.as3swf.tags.TagJPEGTables;
   import com.codeazur.as3swf.tags.TagPlaceObject;
   import com.codeazur.as3swf.tags.TagPlaceObject2;
   import com.codeazur.as3swf.tags.TagPlaceObject3;
   import com.codeazur.as3swf.tags.TagRemoveObject;
   import com.codeazur.as3swf.tags.TagRemoveObject2;
   import com.codeazur.as3swf.tags.TagSetBackgroundColor;
   import com.codeazur.as3swf.tags.TagShowFrame;
   import com.codeazur.as3swf.tags.TagSoundStreamBlock;
   import com.codeazur.as3swf.tags.TagSoundStreamHead;
   import com.codeazur.as3swf.tags.TagSoundStreamHead2;
   import com.codeazur.as3swf.tags.TagStartSound;
   import com.codeazur.as3swf.timeline.Frame;
   import com.codeazur.as3swf.timeline.FrameObject;
   import com.codeazur.as3swf.timeline.Layer;
   import com.codeazur.as3swf.timeline.LayerStrip;
   import com.codeazur.as3swf.timeline.Scene;
   import com.codeazur.as3swf.timeline.SoundStream;
   import com.codeazur.as3swf.timeline._14143;
   import com.codeazur.utils.StringUtils;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import flash.utils.Endian;
   import flash.utils.getTimer;
   
   public class SWFTimelineContainer extends SWFEventDispatcher
   {
      public static var TIMEOUT:int = 50;
      
      public static var AUTOBUILD_LAYERS:Boolean = false;
      
      public static var EXTRACT_SOUND_STREAM:Boolean = true;
      
      protected var _tags:Vector.<ITag>;
      
      protected var _tagsRaw:Vector.<SWFRawTag>;
      
      protected var _dictionary:Dictionary;
      
      protected var _scenes:Vector.<Scene>;
      
      protected var _frames:Vector.<Frame>;
      
      protected var _layers:Vector.<Layer>;
      
      protected var _15067:Dictionary;
      
      protected var _soundStream:SoundStream;
      
      protected var currentFrame:Frame;
      
      protected var frameLabels:Dictionary;
      
      protected var hasSoundStream:Boolean = false;
      
      protected var enterFrameProvider:Sprite;
      
      protected var eof:Boolean;
      
      protected var _tmpData:SWFData;
      
      protected var _tmpVersion:uint;
      
      protected var _tmpTagIterator:int = 0;
      
      protected var _tagFactory:ISWFTagFactory;
      
      internal var rootTimelineContainer:SWFTimelineContainer;
      
      public var backgroundColor:uint = 16777215;
      
      public var jpegTablesTag:TagJPEGTables;
      
      public var _14729:Dictionary;
      
      public var _15069:int;
      
      public function SWFTimelineContainer()
      {
         super();
         this._tags = new Vector.<ITag>();
         this._tagsRaw = new Vector.<SWFRawTag>();
         this._dictionary = new Dictionary();
         this._scenes = new Vector.<Scene>();
         this._frames = new Vector.<Frame>();
         this._layers = new Vector.<Layer>();
         this._15067 = new Dictionary();
         this._tagFactory = new SWFTagFactory();
         this._14729 = new Dictionary();
         this.rootTimelineContainer = this;
         this.enterFrameProvider = new Sprite();
      }
      
      public function get tags() : Vector.<ITag>
      {
         return this._tags;
      }
      
      public function get tagsRaw() : Vector.<SWFRawTag>
      {
         return this._tagsRaw;
      }
      
      public function get dictionary() : Dictionary
      {
         return this._dictionary;
      }
      
      public function get scenes() : Vector.<Scene>
      {
         return this._scenes;
      }
      
      public function get frames() : Vector.<Frame>
      {
         return this._frames;
      }
      
      public function get layers() : Vector.<Layer>
      {
         return this._layers;
      }
      
      public function get _14728() : Dictionary
      {
         return this._15067;
      }
      
      public function get soundStream() : SoundStream
      {
         return this._soundStream;
      }
      
      public function get tagFactory() : ISWFTagFactory
      {
         return this._tagFactory;
      }
      
      public function set tagFactory(param1:ISWFTagFactory) : void
      {
         this._tagFactory = param1;
      }
      
      public function getCharacter(param1:uint) : IDefinitionTag
      {
         var _loc2_:int = int(this.rootTimelineContainer.dictionary[param1]);
         if(_loc2_ >= 0 && _loc2_ < this.rootTimelineContainer.tags.length)
         {
            return this.rootTimelineContainer.tags[_loc2_] as IDefinitionTag;
         }
         return null;
      }
      
      public function parseTags(param1:SWFData, param2:uint) : void
      {
         var _loc3_:ITag = null;
         this.parseTagsInit(param1,param2);
         while(_loc3_ = this.parseTag(param1), (Boolean(_loc3_)) && _loc3_.type != TagEnd.TYPE)
         {
         }
         this.parseTagsFinalize();
      }
      
      public function parseTagsAsync(param1:SWFData, param2:uint) : void
      {
         this.parseTagsInit(param1,param2);
         this.enterFrameProvider.addEventListener(Event.ENTER_FRAME,this.parseTagsAsyncHandler);
      }
      
      protected function parseTagsAsyncHandler(param1:Event) : void
      {
         this.enterFrameProvider.removeEventListener(Event.ENTER_FRAME,this.parseTagsAsyncHandler);
         if(dispatchEvent(new SWFProgressEvent(SWFProgressEvent.PROGRESS,this._tmpData.position,this._tmpData.length,false,true)))
         {
            this.parseTagsAsyncInternal();
         }
      }
      
      protected function parseTagsAsyncInternal() : void
      {
         var _loc1_:ITag = null;
         var _loc2_:int = getTimer();
         while(_loc1_ = this.parseTag(this._tmpData,true), (Boolean(_loc1_)) && _loc1_.type != TagEnd.TYPE)
         {
            if(getTimer() - _loc2_ > TIMEOUT)
            {
               this.enterFrameProvider.addEventListener(Event.ENTER_FRAME,this.parseTagsAsyncHandler);
               return;
            }
         }
         this.parseTagsFinalize();
         if(this.eof)
         {
            dispatchEvent(new SWFErrorEvent(SWFErrorEvent.ERROR,SWFErrorEvent.REASON_EOF));
         }
         else
         {
            dispatchEvent(new SWFProgressEvent(SWFProgressEvent.PROGRESS,this._tmpData.position,this._tmpData.length));
            dispatchEvent(new SWFProgressEvent(SWFProgressEvent.COMPLETE,this._tmpData.position,this._tmpData.length));
         }
      }
      
      protected function parseTagsInit(param1:SWFData, param2:uint) : void
      {
         this.tags.length = 0;
         this.frames.length = 0;
         this.layers.length = 0;
         this._dictionary = new Dictionary();
         this.currentFrame = new Frame();
         this.frameLabels = new Dictionary();
         this.hasSoundStream = false;
         this._tmpData = param1;
         this._tmpVersion = param2;
      }
      
      protected function parseTag(param1:SWFData, param2:Boolean = false) : ITag
      {
         var tagRaw:SWFRawTag;
         var tagHeader:SWFRecordHeader;
         var tag:ITag;
         var timelineContainer:SWFTimelineContainer = null;
         var index:uint = 0;
         var excessBytes:int = 0;
         var eventType:String = null;
         var eventData:Object = null;
         var event:SWFWarningEvent = null;
         var cancelled:Boolean = false;
         var data:SWFData = param1;
         var async:Boolean = param2;
         var pos:uint = data.position;
         this.eof = pos >= data.length;
         if(this.eof)
         {
            return null;
         }
         tagRaw = data.readRawTag();
         tagHeader = tagRaw.header;
         tag = this.tagFactory.create(tagHeader.type);
         try
         {
            if(tag is SWFTimelineContainer)
            {
               timelineContainer = tag as SWFTimelineContainer;
               timelineContainer.tagFactory = this.tagFactory;
               timelineContainer.rootTimelineContainer = this;
            }
            tag.parse(data,tagHeader.contentLength,this._tmpVersion,async);
         }
         catch(e:Error)
         {
            throw e;
         }
         this.tags.push(tag);
         this.tagsRaw.push(tagRaw);
         this.processTag(tag);
         if(data.position != pos + tagHeader.tagLength)
         {
            index = this.tags.length - 1;
            excessBytes = data.position - (pos + tagHeader.tagLength);
            eventType = excessBytes < 0 ? SWFWarningEvent.UNDERFLOW : SWFWarningEvent.OVERFLOW;
            eventData = {
               "pos":pos,
               "bytes":(excessBytes < 0 ? -excessBytes : excessBytes)
            };
            if(this.rootTimelineContainer != this)
            {
               eventData.indexRoot = this.rootTimelineContainer.tags.length;
            }
            event = new SWFWarningEvent(eventType,index,eventData,false,true);
            cancelled = !dispatchEvent(event);
            if(cancelled)
            {
               tag = null;
            }
            data.position = pos + tagHeader.tagLength;
         }
         return tag;
      }
      
      protected function parseTagsFinalize() : void
      {
         if(this.soundStream && this.soundStream.data.length == 0 && this.soundStream._15074.length == 0)
         {
            this._soundStream = null;
         }
         if(AUTOBUILD_LAYERS)
         {
            this.buildLayers();
         }
      }
      
      public function publishTags(param1:SWFData, param2:uint) : void
      {
         var _loc3_:ITag = null;
         var _loc4_:SWFRawTag = null;
         var _loc5_:uint = 0;
         while(_loc5_ < this.tags.length)
         {
            _loc3_ = this.tags[_loc5_];
            _loc4_ = _loc5_ < this.tagsRaw.length ? this.tagsRaw[_loc5_] : null;
            this.publishTag(param1,_loc3_,_loc4_,param2);
            _loc5_++;
         }
      }
      
      public function publishTagsAsync(param1:SWFData, param2:uint) : void
      {
         this._tmpData = param1;
         this._tmpVersion = param2;
         this._tmpTagIterator = 0;
         this.enterFrameProvider.addEventListener(Event.ENTER_FRAME,this.publishTagsAsyncHandler);
      }
      
      protected function publishTagsAsyncHandler(param1:Event) : void
      {
         this.enterFrameProvider.removeEventListener(Event.ENTER_FRAME,this.publishTagsAsyncHandler);
         if(dispatchEvent(new SWFProgressEvent(SWFProgressEvent.PROGRESS,this._tmpTagIterator,this.tags.length)))
         {
            this.publishTagsAsyncInternal();
         }
      }
      
      protected function publishTagsAsyncInternal() : void
      {
         var _loc1_:ITag = null;
         var _loc2_:SWFRawTag = null;
         var _loc3_:int = getTimer();
         while(true)
         {
            _loc1_ = this._tmpTagIterator < this.tags.length ? this.tags[this._tmpTagIterator] : null;
            _loc2_ = this._tmpTagIterator < this.tagsRaw.length ? this.tagsRaw[this._tmpTagIterator] : null;
            this.publishTag(this._tmpData,_loc1_,_loc2_,this._tmpVersion);
            ++this._tmpTagIterator;
            if(getTimer() - _loc3_ > TIMEOUT)
            {
               break;
            }
            if(_loc1_.type == TagEnd.TYPE)
            {
               dispatchEvent(new SWFProgressEvent(SWFProgressEvent.PROGRESS,this._tmpTagIterator,this.tags.length));
               dispatchEvent(new SWFProgressEvent(SWFProgressEvent.COMPLETE,this._tmpTagIterator,this.tags.length));
               return;
            }
         }
         this.enterFrameProvider.addEventListener(Event.ENTER_FRAME,this.publishTagsAsyncHandler);
      }
      
      public function publishTag(param1:SWFData, param2:ITag, param3:SWFRawTag, param4:uint) : void
      {
         var data:SWFData = param1;
         var tag:ITag = param2;
         var rawTag:SWFRawTag = param3;
         var version:uint = param4;
         try
         {
            tag.publish(data,version);
         }
         catch(e:Error)
         {
            if(rawTag)
            {
               rawTag.publish(data);
            }
         }
      }
      
      protected function processTag(param1:ITag) : void
      {
         var _loc2_:uint = this.tags.length - 1;
         if(param1 is IDefinitionTag)
         {
            this.processDefinitionTag(param1 as IDefinitionTag,_loc2_);
            return;
         }
         if(param1 is IDisplayListTag)
         {
            this.processDisplayListTag(param1 as IDisplayListTag,_loc2_);
            return;
         }
         switch(param1.type)
         {
            case TagFrameLabel.TYPE:
            case TagDefineSceneAndFrameLabelData.TYPE:
               this.processFrameLabelTag(param1,_loc2_);
               break;
            case TagSoundStreamHead.TYPE:
            case TagSoundStreamHead2.TYPE:
            case TagSoundStreamBlock.TYPE:
               if(EXTRACT_SOUND_STREAM)
               {
                  this.processSoundStreamTag(param1,_loc2_);
               }
               break;
            case TagSetBackgroundColor.TYPE:
               this.processBackgroundColorTag(param1 as TagSetBackgroundColor,_loc2_);
               break;
            case TagJPEGTables.TYPE:
               this.processJPEGTablesTag(param1 as TagJPEGTables,_loc2_);
               break;
            case TagStartSound.TYPE:
               this._15066(param1 as TagStartSound);
         }
      }
      
      protected function _15066(param1:TagStartSound) : void
      {
         var _loc2_:_14143 = new _14143();
         _loc2_.startFrame = this.currentFrame.frameNumber;
         _loc2_._15070 = param1;
         if(!this._15067[this.currentFrame.frameNumber])
         {
            this._15067[this.currentFrame.frameNumber] = new Vector.<_14143>();
         }
         this._15067[this.currentFrame.frameNumber].push(_loc2_);
      }
      
      protected function processDefinitionTag(param1:IDefinitionTag, param2:uint) : void
      {
         var _loc3_:* = this is TagDefineSprite;
         this._15069 = param1.characterId;
         if(param1.characterId > 0)
         {
            if(!this.dictionary[param1.characterId])
            {
            }
            if(!this.dictionary[param1.characterId])
            {
               this.dictionary[param1.characterId] = param2;
            }
            this.currentFrame.characters.push(param1.characterId);
            if(param1 is TagDefineButton || param1 is TagDefineButton2)
            {
            }
         }
      }
      
      protected function processDisplayListTag(param1:IDisplayListTag, param2:uint) : void
      {
         switch(param1.type)
         {
            case TagShowFrame.TYPE:
               this.currentFrame.tagIndexEnd = param2;
               if(this.currentFrame.label == null && Boolean(this.frameLabels[this.currentFrame.frameNumber]))
               {
                  this.currentFrame.label = this.frameLabels[this.currentFrame.frameNumber];
               }
               this.frames.push(this.currentFrame);
               this.currentFrame = this.currentFrame.clone();
               this.currentFrame.frameNumber = this.frames.length;
               this.currentFrame.tagIndexStart = param2 + 1;
               break;
            case TagPlaceObject.TYPE:
            case TagPlaceObject2.TYPE:
            case TagPlaceObject3.TYPE:
               this.currentFrame.placeObject(param2,param1 as TagPlaceObject);
               break;
            case TagRemoveObject.TYPE:
            case TagRemoveObject2.TYPE:
               this.currentFrame.removeObject(param1 as TagRemoveObject);
               this._15068(this.currentFrame,param1 as TagRemoveObject);
         }
      }
      
      private function _15062(param1:*) : void
      {
         var _loc2_:SWFButtonRecord = null;
         var _loc3_:Boolean = false;
         var _loc5_:uint = 0;
         var _loc6_:* = null;
         var _loc4_:int = 0;
         while(_loc4_ < param1.characters.length)
         {
            _loc2_ = param1.characters[_loc4_];
            _loc3_ = true;
            if(_loc2_.placeMatrix && !_loc2_.placeMatrix.isIdentity() && (_loc2_.placeMatrix.scaleX > Config.MAX_SHAPE_SCALE_NUM || _loc2_.placeMatrix.scaleY > Config.MAX_SHAPE_SCALE_NUM))
            {
               _loc3_ = false;
            }
            if(Boolean(_loc2_.colorTransform) && !_loc2_.colorTransform.isIdentity())
            {
               _loc3_ = false;
            }
            if(!_loc3_)
            {
               _loc5_ = this.tags.length - 1;
               _loc6_ = this is TagDefineSprite ? "definesprite cid:" + (this as TagDefineSprite).characterId : "tag index:" + _loc5_;
               _loc6_ = _loc6_ + "button";
               this._15065(_loc2_,_loc6_);
            }
            _loc4_++;
         }
      }
      
      private function _15064(param1:TagPlaceObject) : Boolean
      {
         var _loc2_:Boolean = true;
         if(param1.hasMatrix && !param1.matrix.isIdentity() && (param1.matrix.scaleX > Config.MAX_SHAPE_SCALE_NUM || param1.matrix.scaleY > Config.MAX_SHAPE_SCALE_NUM))
         {
            _loc2_ = false;
         }
         if(param1.hasColorTransform && !param1.colorTransform.isIdentity() && Config.SHAPE_COLORTRASNFORM)
         {
            _loc2_ = false;
         }
         return _loc2_;
      }
      
      private function _15060(param1:*, param2:String) : void
      {
         var _loc3_:IDefinitionTag = null;
         var _loc4_:TagDefineSprite = null;
         var _loc5_:int = 0;
         var _loc6_:Dictionary = null;
         var _loc7_:String = null;
         var _loc8_:TagPlaceObject = null;
         _loc3_ = this.getCharacter(param1.characterId);
         if(_loc3_ is TagDefineShape)
         {
            (_loc3_ as TagDefineShape)._15072 = true;
         }
         else if(_loc3_ is TagDefineSprite && !(_loc3_ as TagDefineSprite)._15063)
         {
            (_loc4_ = _loc3_ as TagDefineSprite)._15063 = true;
            _loc5_ = 0;
            while(_loc5_ < _loc4_.frames.length)
            {
               _loc6_ = _loc4_.frames[_loc5_].objects;
               for(_loc7_ in _loc6_)
               {
                  _loc8_ = _loc6_[_loc7_]._14730;
                  this._15060(_loc8_,param2);
               }
               _loc5_++;
            }
         }
      }
      
      private function _15065(param1:*, param2:String) : void
      {
         var _loc3_:IDefinitionTag = null;
         var _loc4_:TagDefineSprite = null;
         var _loc5_:int = 0;
         var _loc6_:Dictionary = null;
         var _loc7_:String = null;
         var _loc8_:TagPlaceObject = null;
         var _loc9_:* = undefined;
         var _loc10_:int = 0;
         var _loc11_:SWFButtonRecord = null;
         _loc3_ = this.getCharacter(param1.characterId);
         if(_loc3_ is TagDefineShape)
         {
            if((_loc3_ as TagDefineShape)._15071)
            {
               (_loc3_ as TagDefineShape)._15071 = false;
            }
         }
         else if(_loc3_ is TagDefineSprite && !(_loc3_ as TagDefineSprite)._15061)
         {
            (_loc4_ = _loc3_ as TagDefineSprite)._15061 = true;
            _loc5_ = 0;
            while(_loc5_ < _loc4_.frames.length)
            {
               _loc6_ = _loc4_.frames[_loc5_].objects;
               for(_loc7_ in _loc6_)
               {
                  _loc8_ = _loc6_[_loc7_]._14730;
                  this._15065(_loc8_,param2);
               }
               _loc5_++;
            }
         }
         else if(_loc3_ is TagDefineButton || _loc3_ is TagDefineButton2)
         {
            _loc9_ = _loc3_;
            _loc10_ = 0;
            while(_loc10_ < _loc9_.characters.length)
            {
               _loc11_ = _loc9_.characters[_loc10_];
               this._15065(_loc11_,param2);
               _loc10_++;
            }
         }
      }
      
      private function _15068(param1:Frame, param2:TagRemoveObject) : void
      {
         if(!this._14729[param1.frameNumber + 1])
         {
            this._14729[param1.frameNumber + 1] = [];
         }
         this._14729[param1.frameNumber + 1].push(param2.depth);
      }
      
      protected function processFrameLabelTag(param1:ITag, param2:uint) : void
      {
         var _loc3_:TagDefineSceneAndFrameLabelData = null;
         var _loc4_:uint = 0;
         var _loc5_:TagFrameLabel = null;
         var _loc6_:SWFFrameLabel = null;
         var _loc7_:SWFScene = null;
         switch(param1.type)
         {
            case TagDefineSceneAndFrameLabelData.TYPE:
               _loc3_ = param1 as TagDefineSceneAndFrameLabelData;
               _loc4_ = 0;
               while(_loc4_ < _loc3_.frameLabels.length)
               {
                  _loc6_ = _loc3_.frameLabels[_loc4_] as SWFFrameLabel;
                  this.frameLabels[_loc6_.frameNumber] = _loc6_.name;
                  _loc4_++;
               }
               _loc4_ = 0;
               while(_loc4_ < _loc3_.scenes.length)
               {
                  _loc7_ = _loc3_.scenes[_loc4_] as SWFScene;
                  this.scenes.push(new Scene(_loc7_.offset,_loc7_.name));
                  _loc4_++;
               }
               break;
            case TagFrameLabel.TYPE:
               _loc5_ = param1 as TagFrameLabel;
               this.currentFrame.label = _loc5_.frameName;
               this.currentFrame.labels.push(_loc5_.frameName);
         }
      }
      
      protected function processSoundStreamTag(param1:ITag, param2:uint) : void
      {
         var _loc3_:TagSoundStreamHead = null;
         var _loc4_:TagSoundStreamBlock = null;
         var _loc5_:ByteArray = null;
         var _loc6_:uint = 0;
         var _loc7_:int = 0;
         switch(param1.type)
         {
            case TagSoundStreamHead.TYPE:
            case TagSoundStreamHead2.TYPE:
               _loc3_ = param1 as TagSoundStreamHead;
               this._soundStream = new SoundStream();
               this.soundStream.compression = _loc3_.streamSoundCompression;
               this.soundStream.rate = _loc3_.streamSoundRate;
               this.soundStream.size = _loc3_.streamSoundSize;
               this.soundStream.type = _loc3_.streamSoundType;
               this.soundStream.numFrames = 0;
               this.soundStream.numSamples = 0;
               break;
            case TagSoundStreamBlock.TYPE:
               if(this.soundStream != null)
               {
                  if(!this.hasSoundStream)
                  {
                     this.hasSoundStream = true;
                     this.soundStream.startFrame = this.currentFrame.frameNumber;
                  }
                  _loc4_ = param1 as TagSoundStreamBlock;
                  (_loc5_ = _loc4_.soundData).endian = Endian.LITTLE_ENDIAN;
                  _loc5_.position = 0;
                  switch(this.soundStream.compression)
                  {
                     case SoundCompression.ADPCM:
                     case SoundCompression.UNCOMPRESSED_NATIVE_ENDIAN:
                     case SoundCompression.UNCOMPRESSED_LITTLE_ENDIAN:
                     case SoundCompression.NELLYMOSER_16_KHZ:
                     case SoundCompression.NELLYMOSER_16_KHZ:
                     case SoundCompression.NELLYMOSER:
                        this.soundStream._15074.push(_loc5_);
                        break;
                     case SoundCompression.MP3:
                        _loc6_ = _loc5_.readUnsignedShort();
                        _loc7_ = _loc5_.readShort();
                        if(_loc6_ > 0)
                        {
                           this.soundStream.numSamples += _loc6_;
                           this.soundStream.data.writeBytes(_loc5_,4);
                        }
                  }
                  ++this.soundStream.numFrames;
                  this.soundStream._15073 = this.currentFrame.frameNumber;
               }
         }
      }
      
      protected function processBackgroundColorTag(param1:TagSetBackgroundColor, param2:uint) : void
      {
         this.backgroundColor = param1.color;
      }
      
      protected function processJPEGTablesTag(param1:TagJPEGTables, param2:uint) : void
      {
         this.jpegTablesTag = param1;
      }
      
      public function buildLayers() : void
      {
         var _loc1_:uint = 0;
         var _loc2_:String = null;
         var _loc3_:uint = 0;
         var _loc6_:Frame = null;
         var _loc7_:Layer = null;
         var _loc8_:Array = null;
         var _loc9_:uint = 0;
         var _loc10_:uint = 0;
         var _loc11_:uint = 0;
         var _loc12_:uint = 0;
         var _loc13_:uint = 0;
         var _loc14_:uint = 0;
         var _loc15_:FrameObject = null;
         var _loc16_:Dictionary = null;
         var _loc4_:Dictionary = new Dictionary();
         var _loc5_:Array = [];
         _loc1_ = 0;
         while(_loc1_ < this.frames.length)
         {
            _loc6_ = this.frames[_loc1_];
            for(_loc2_ in _loc6_.objects)
            {
               _loc3_ = parseInt(_loc2_);
               if(_loc5_.indexOf(_loc3_) > -1)
               {
                  (_loc4_[_loc2_] as Array).push(_loc6_.frameNumber);
               }
               else
               {
                  _loc4_[_loc2_] = [_loc6_.frameNumber];
                  _loc5_.push(_loc3_);
               }
            }
            _loc1_++;
         }
         _loc5_.sort(Array.NUMERIC);
         _loc1_ = 0;
         while(_loc1_ < _loc5_.length)
         {
            _loc7_ = new Layer(_loc5_[_loc1_],this.frames.length);
            _loc8_ = _loc4_[_loc5_[_loc1_].toString()];
            if((_loc9_ = _loc8_.length) > 0)
            {
               _loc10_ = LayerStrip.TYPE_EMPTY;
               _loc11_ = uint.MAX_VALUE;
               _loc12_ = uint.MAX_VALUE;
               _loc13_ = 0;
               while(_loc13_ < _loc9_)
               {
                  _loc14_ = uint(_loc8_[_loc13_]);
                  _loc15_ = this.frames[_loc14_].objects[_loc7_.depth] as FrameObject;
                  if(_loc15_.isKeyframe)
                  {
                     _loc7_.appendStrip(_loc10_,_loc11_,_loc12_);
                     _loc11_ = _loc14_;
                     _loc10_ = this.getCharacter(_loc15_.characterId) is TagDefineMorphShape ? LayerStrip.TYPE_SHAPETWEEN : LayerStrip.TYPE_STATIC;
                  }
                  else if(_loc10_ == LayerStrip.TYPE_STATIC && _loc15_.lastModifiedAtIndex > 0)
                  {
                     _loc10_ = LayerStrip.TYPE_MOTIONTWEEN;
                  }
                  _loc12_ = _loc14_;
                  _loc13_++;
               }
               _loc7_.appendStrip(_loc10_,_loc11_,_loc12_);
            }
            this._layers.push(_loc7_);
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < this.frames.length)
         {
            _loc16_ = this.frames[_loc1_].objects;
            for(_loc2_ in _loc16_)
            {
               FrameObject(_loc16_[_loc2_]).layer = _loc5_.indexOf(parseInt(_loc2_));
            }
            _loc1_++;
         }
      }
      
      public function toString(param1:uint = 0, param2:uint = 0) : String
      {
         var _loc3_:uint = 0;
         var _loc4_:String = "";
         if(this.tags.length > 0)
         {
            _loc4_ += "\n" + StringUtils.repeat(param1 + 2) + "Tags:";
            _loc3_ = 0;
            while(_loc3_ < this.tags.length)
            {
               _loc4_ += "\n" + this.tags[_loc3_].toString(param1 + 4);
               _loc3_++;
            }
         }
         if((param2 & SWF.TOSTRING_FLAG_TIMELINE_STRUCTURE) != 0)
         {
            if(this.scenes.length > 0)
            {
               _loc4_ += "\n" + StringUtils.repeat(param1 + 2) + "Scenes:";
               _loc3_ = 0;
               while(_loc3_ < this.scenes.length)
               {
                  _loc4_ += "\n" + this.scenes[_loc3_].toString(param1 + 4);
                  _loc3_++;
               }
            }
            if(this.frames.length > 0)
            {
               _loc4_ += "\n" + StringUtils.repeat(param1 + 2) + "Frames:";
               _loc3_ = 0;
               while(_loc3_ < this.frames.length)
               {
                  _loc4_ += "\n" + this.frames[_loc3_].toString(param1 + 4);
                  _loc3_++;
               }
            }
            if(this.layers.length > 0)
            {
               _loc4_ += "\n" + StringUtils.repeat(param1 + 2) + "Layers:";
               _loc3_ = 0;
               while(_loc3_ < this.layers.length)
               {
                  _loc4_ += "\n" + StringUtils.repeat(param1 + 4) + "[" + _loc3_ + "] " + this.layers[_loc3_].toString(param1 + 4);
                  _loc3_++;
               }
            }
         }
         return _loc4_;
      }
   }
}

