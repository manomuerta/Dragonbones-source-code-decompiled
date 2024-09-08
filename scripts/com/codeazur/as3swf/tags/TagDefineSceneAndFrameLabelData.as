package com.codeazur.as3swf.tags
{
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.data.SWFFrameLabel;
   import com.codeazur.as3swf.data.SWFScene;
   import com.codeazur.utils.StringUtils;
   
   public class TagDefineSceneAndFrameLabelData implements ITag
   {
      public static const TYPE:uint = 86;
      
      protected var _scenes:Vector.<SWFScene>;
      
      protected var _frameLabels:Vector.<SWFFrameLabel>;
      
      public function TagDefineSceneAndFrameLabelData()
      {
         super();
         this._scenes = new Vector.<SWFScene>();
         this._frameLabels = new Vector.<SWFFrameLabel>();
      }
      
      public function get scenes() : Vector.<SWFScene>
      {
         return this._scenes;
      }
      
      public function get frameLabels() : Vector.<SWFFrameLabel>
      {
         return this._frameLabels;
      }
      
      public function parse(param1:SWFData, param2:uint, param3:uint, param4:Boolean = false) : void
      {
         var _loc5_:uint = 0;
         var _loc8_:uint = 0;
         var _loc9_:String = null;
         var _loc10_:uint = 0;
         var _loc11_:String = null;
         var _loc6_:uint = param1.readEncodedU32();
         _loc5_ = 0;
         while(_loc5_ < _loc6_)
         {
            _loc8_ = param1.readEncodedU32();
            _loc9_ = param1.readString();
            this._scenes.push(new SWFScene(_loc8_,_loc9_));
            _loc5_++;
         }
         var _loc7_:uint = param1.readEncodedU32();
         _loc5_ = 0;
         while(_loc5_ < _loc7_)
         {
            _loc10_ = param1.readEncodedU32();
            _loc11_ = param1.readString();
            this._frameLabels.push(new SWFFrameLabel(_loc10_,_loc11_));
            _loc5_++;
         }
      }
      
      public function publish(param1:SWFData, param2:uint) : void
      {
         var _loc3_:uint = 0;
         var _loc5_:SWFScene = null;
         var _loc6_:SWFFrameLabel = null;
         var _loc4_:SWFData = new SWFData();
         _loc4_.writeEncodedU32(this.scenes.length);
         _loc3_ = 0;
         while(_loc3_ < this.scenes.length)
         {
            _loc5_ = this.scenes[_loc3_];
            _loc4_.writeEncodedU32(_loc5_.offset);
            _loc4_.writeString(_loc5_.name);
            _loc3_++;
         }
         _loc4_.writeEncodedU32(this.frameLabels.length);
         _loc3_ = 0;
         while(_loc3_ < this.frameLabels.length)
         {
            _loc6_ = this.frameLabels[_loc3_];
            _loc4_.writeEncodedU32(_loc6_.frameNumber);
            _loc4_.writeString(_loc6_.name);
            _loc3_++;
         }
         param1.writeTagHeader(this.type,_loc4_.length);
         param1.writeBytes(_loc4_);
      }
      
      public function get type() : uint
      {
         return TYPE;
      }
      
      public function get name() : String
      {
         return "DefineSceneAndFrameLabelData";
      }
      
      public function get version() : uint
      {
         return 9;
      }
      
      public function get level() : uint
      {
         return 1;
      }
      
      public function toString(param1:uint = 0, param2:uint = 0) : String
      {
         var _loc4_:uint = 0;
         var _loc3_:String = Tag.toStringCommon(this.type,this.name,param1);
         if(this._scenes.length > 0)
         {
            _loc3_ += "\n" + StringUtils.repeat(param1 + 2) + "Scenes:";
            _loc4_ = 0;
            while(_loc4_ < this._scenes.length)
            {
               _loc3_ += "\n" + StringUtils.repeat(param1 + 4) + "[" + _loc4_ + "] " + this._scenes[_loc4_].toString();
               _loc4_++;
            }
         }
         if(this._frameLabels.length > 0)
         {
            _loc3_ += "\n" + StringUtils.repeat(param1 + 2) + "FrameLabels:";
            _loc4_ = 0;
            while(_loc4_ < this._frameLabels.length)
            {
               _loc3_ += "\n" + StringUtils.repeat(param1 + 4) + "[" + _loc4_ + "] " + this._frameLabels[_loc4_].toString();
               _loc4_++;
            }
         }
         return _loc3_;
      }
   }
}

