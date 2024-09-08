package com.codeazur.as3swf.tags
{
   import com.codeazur.as3swf.SWF;
   import com.codeazur.as3swf.SWFData;
   import com.codeazur.as3swf.data.SWFButtonRecord;
   import com.codeazur.as3swf.data.actions.Action;
   import com.codeazur.as3swf.data.actions.IAction;
   import com.codeazur.as3swf.data.actions._14132;
   import com.codeazur.utils.StringUtils;
   import flash.utils.Dictionary;
   
   public class TagDefineButton implements IDefinitionTag
   {
      public static const TYPE:uint = 7;
      
      public static const STATE_UP:String = "up";
      
      public static const STATE_OVER:String = "over";
      
      public static const STATE_DOWN:String = "down";
      
      public static const STATE_HIT:String = "hit";
      
      protected var _characterId:uint;
      
      protected var _characters:Vector.<SWFButtonRecord>;
      
      protected var _actions:Vector.<IAction>;
      
      protected var frames:Dictionary;
      
      protected var _14978:uint;
      
      public function TagDefineButton()
      {
         super();
         this._characters = new Vector.<SWFButtonRecord>();
         this._actions = new Vector.<IAction>();
         this.frames = new Dictionary();
      }
      
      public function get characterId() : uint
      {
         return this._characterId;
      }
      
      public function set characterId(param1:uint) : void
      {
         this._characterId = param1;
      }
      
      public function get characters() : Vector.<SWFButtonRecord>
      {
         return this._characters;
      }
      
      public function get actions() : Vector.<IAction>
      {
         return this._actions;
      }
      
      public function parse(param1:SWFData, param2:uint, param3:uint, param4:Boolean = false) : void
      {
         var _loc5_:SWFButtonRecord = null;
         var _loc6_:IAction = null;
         this._characterId = param1.readUI16();
         while(_loc5_ = param1.readBUTTONRECORD(), _loc5_ != null)
         {
            this._characters.push(_loc5_);
         }
         while(_loc6_ = param1.readACTIONRECORD(), _loc6_ != null)
         {
            this._actions.push(_loc6_);
         }
         this._14978 = Action._14976(this._actions);
         this.processRecords();
      }
      
      public function publish(param1:SWFData, param2:uint) : void
      {
         var _loc3_:uint = 0;
         var _loc4_:SWFData = new SWFData();
         _loc4_.writeUI16(this.characterId);
         _loc3_ = 0;
         while(_loc3_ < this.characters.length)
         {
            param1.writeBUTTONRECORD(this.characters[_loc3_]);
            _loc3_++;
         }
         param1.writeUI8(0);
         _loc3_ = 0;
         while(_loc3_ < this.actions.length)
         {
            param1.writeACTIONRECORD(this.actions[_loc3_]);
            _loc3_++;
         }
         param1.writeUI8(0);
         param1.writeTagHeader(this.type,_loc4_.length);
         param1.writeBytes(_loc4_);
      }
      
      public function clone() : IDefinitionTag
      {
         var _loc1_:uint = 0;
         var _loc2_:TagDefineButton = new TagDefineButton();
         _loc2_.characterId = this.characterId;
         _loc1_ = 0;
         while(_loc1_ < this.characters.length)
         {
            _loc2_.characters.push(this.characters[_loc1_].clone());
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < this.actions.length)
         {
            _loc2_.actions.push(this.actions[_loc1_].clone());
            _loc1_++;
         }
         return _loc2_;
      }
      
      public function getRecordsByState(param1:String) : Vector.<SWFButtonRecord>
      {
         return this.frames[param1] as Vector.<SWFButtonRecord>;
      }
      
      public function get type() : uint
      {
         return TYPE;
      }
      
      public function get name() : String
      {
         return "DefineButton";
      }
      
      public function get version() : uint
      {
         return 1;
      }
      
      public function get level() : uint
      {
         return 1;
      }
      
      public function _15078() : Array
      {
         return [this.frames[STATE_UP],this.frames[STATE_OVER],this.frames[STATE_DOWN],this.frames[STATE_HIT]];
      }
      
      protected function processRecords() : void
      {
         var _loc6_:SWFButtonRecord = null;
         var _loc1_:Vector.<SWFButtonRecord> = new Vector.<SWFButtonRecord>();
         var _loc2_:Vector.<SWFButtonRecord> = new Vector.<SWFButtonRecord>();
         var _loc3_:Vector.<SWFButtonRecord> = new Vector.<SWFButtonRecord>();
         var _loc4_:Vector.<SWFButtonRecord> = new Vector.<SWFButtonRecord>();
         var _loc5_:uint = 0;
         while(_loc5_ < this.characters.length)
         {
            _loc6_ = this.characters[_loc5_];
            if(_loc6_.stateUp)
            {
               _loc1_.push(_loc6_);
            }
            if(_loc6_.stateOver)
            {
               _loc2_.push(_loc6_);
            }
            if(_loc6_.stateDown)
            {
               _loc3_.push(_loc6_);
            }
            if(_loc6_.stateHitTest)
            {
               _loc4_.push(_loc6_);
            }
            _loc5_++;
         }
         this.frames[STATE_UP] = _loc1_.sort(this.sortByDepthCompareFunction);
         this.frames[STATE_OVER] = _loc2_.sort(this.sortByDepthCompareFunction);
         this.frames[STATE_DOWN] = _loc3_.sort(this.sortByDepthCompareFunction);
         this.frames[STATE_HIT] = _loc4_.sort(this.sortByDepthCompareFunction);
      }
      
      protected function sortByDepthCompareFunction(param1:SWFButtonRecord, param2:SWFButtonRecord) : Number
      {
         if(param1.placeDepth < param2.placeDepth)
         {
            return -1;
         }
         if(param1.placeDepth > param2.placeDepth)
         {
            return 1;
         }
         return 0;
      }
      
      public function toString(param1:uint = 0, param2:uint = 0) : String
      {
         var _loc4_:uint = 0;
         var _loc5_:_14132 = null;
         var _loc3_:String = Tag.toStringCommon(this.type,this.name,param1) + "ID: " + this._characterId;
         if(this._characters.length > 0)
         {
            _loc3_ += "\n" + StringUtils.repeat(param1 + 2) + "Characters:";
            _loc4_ = 0;
            while(_loc4_ < this._characters.length)
            {
               _loc3_ += "\n" + StringUtils.repeat(param1 + 4) + "[" + _loc4_ + "] " + this._characters[_loc4_].toString(param1 + 4);
               _loc4_++;
            }
         }
         if(this._actions.length > 0)
         {
            _loc3_ += "\n" + StringUtils.repeat(param1 + 2) + "Actions:";
            if((param2 & SWF.TOSTRING_FLAG_AVM1_BYTECODE) == 0)
            {
               _loc4_ = 0;
               while(_loc4_ < this._actions.length)
               {
                  _loc3_ += "\n" + StringUtils.repeat(param1 + 4) + "[" + _loc4_ + "] " + this._actions[_loc4_].toString(param1 + 4);
                  _loc4_++;
               }
            }
            else
            {
               _loc5_ = new _14132(this._actions,[],this._14978);
               _loc4_ = 0;
               while(_loc4_ < this._actions.length)
               {
                  _loc3_ += "\n" + StringUtils.repeat(param1 + 4) + this._actions[_loc4_]._14979(param1 + 4,_loc5_);
                  _loc4_++;
               }
               if(_loc5_._14983 != null)
               {
                  _loc3_ += "\n" + StringUtils.repeat(param1 + 6) + _loc5_._14983 + ":";
               }
            }
         }
         return _loc3_;
      }
   }
}

