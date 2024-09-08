package _13545
{
   import _1038._1037;
   import _13492._13496;
   import _13505._13510;
   import _636.TimelineEvent;
   import _97._100;
   
   public class _13547
   {
      public var frames:Vector.<_13496>;
      
      public var parent:_1037;
      
      private var _13929:Boolean;
      
      private var _selected:Boolean;
      
      public var flag:String;
      
      public var _2713:Boolean;
      
      public function _13547()
      {
         super();
         this.frames = new Vector.<_13496>();
      }
      
      public static function _3996(param1:_1037, param2:_13496) : _13547
      {
         var _loc3_:_13547 = new _13547();
         _loc3_.parent = param1;
         _loc3_.frames.push(param2);
         return _loc3_;
      }
      
      public function get color() : uint
      {
         if(this.frames.length == 1)
         {
            switch(this.frames[0].flag)
            {
               case _13510.FLAG_TRANSLATE:
                  return _100.TRANSLATE_FRAME_COLOR;
               case _13510.FLAG_ROTATE:
                  return _100.ROTATE_FRAME_COLOR;
               case _13510.FLAG_SCALE:
                  return _100.SCALE_FRAME_COLOR;
               case _13510.FLAG_COLOR:
                  return _100.COLOR_FRAME_COLOR;
               case _13510.FLAG_VISIBLE:
                  return _100.VISIBLE_FRAME_COLOR;
               case _13510.FLAG_DISPLAY_INDEX:
                  return _100.INDEX_FRAME_COLOR;
               case _13510.FLAG_ZORDER:
                  return _100.Z_FRAME_COLOR;
               case _13510.FLAG_FFD:
                  return _100.FFD_COLOR;
               case _13510.FLAG_EVENT:
                  return _100.EVENT_COLOR;
               case _13510.FLAG_IK:
                  return _100.IK_COLOR;
               default:
                  return _100.MULT_COLOR;
            }
         }
         else
         {
            switch(this.flag)
            {
               case _13510.FLAG_SLOT:
                  return _100.SLOT_COLOR;
               default:
                  return _100.MULT_COLOR;
            }
         }
      }
      
      public function get frameNum() : int
      {
         return this.frames.length;
      }
      
      public function get selected() : Boolean
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         _loc1_ = 0;
         _loc2_ = int(this.frames.length);
         while(_loc1_ < _loc2_)
         {
            if(!this.frames[_loc1_].selected)
            {
               return false;
            }
            _loc1_++;
         }
         return true;
      }
      
      public function set selected(param1:Boolean) : void
      {
         if(this._selected != param1)
         {
            this._selected = param1;
            if(this.parent)
            {
               this.parent.dispatchEvent(new TimelineEvent(TimelineEvent.UPDATE));
               this.parent._4016(this);
            }
         }
      }
      
      public function get _1707() : Boolean
      {
         return this.flag == _13510.FLAG_ANIMATION;
      }
      
      public function get frameIndex() : int
      {
         if(this.frames.length > 0)
         {
            return this.frames[0].startPos;
         }
         return -1;
      }
      
      public function get tweenEnabled() : Boolean
      {
         if(this._2713)
         {
            return true;
         }
         if(this.frames.length == 1)
         {
            switch(this.flag)
            {
               case _13510.FLAG_TRANSLATE:
               case _13510.FLAG_ROTATE:
               case _13510.FLAG_SCALE:
               case _13510.FLAG_COLOR:
               case _13510.FLAG_FFD:
               case _13510.FLAG_IK:
                  return this.frames[0]._13663;
               case _13510.FLAG_VISIBLE:
               case _13510.FLAG_DISPLAY_INDEX:
               case _13510.FLAG_ZORDER:
               case _13510.FLAG_EVENT:
            }
            return false;
         }
         return false;
      }
      
      public function get _11515() : Boolean
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(this._2713)
         {
            _loc1_ = 0;
            _loc2_ = int(this.frames.length);
            while(_loc1_ < _loc2_)
            {
               if(this.frames[_loc1_].flag == _13510.FLAG_TRANSLATE)
               {
                  return this.frames[_loc1_]._11515;
               }
               _loc1_++;
            }
            return false;
         }
         if(this.frames.length == 1)
         {
            return this.frames[0]._11515;
         }
         return false;
      }
      
      public function get _13642() : Boolean
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(this._2713)
         {
            _loc1_ = 0;
            _loc2_ = int(this.frames.length);
            while(_loc1_ < _loc2_)
            {
               if(this.frames[_loc1_].flag == _13510.FLAG_TRANSLATE)
               {
                  return this.frames[_loc1_]._13642;
               }
               _loc1_++;
            }
            return false;
         }
         if(this.frames.length == 1)
         {
            return this.frames[0]._13642;
         }
         return false;
      }
      
      public function get _3409() : Boolean
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(this._2713)
         {
            _loc1_ = 0;
            _loc1_ = 0;
            _loc2_ = int(this.frames.length);
            while(_loc1_ < _loc2_)
            {
               if(this.frames[_loc1_].flag == _13510.FLAG_DISPLAY_INDEX && this.frames[_loc1_].value == null)
               {
                  return true;
               }
               _loc1_++;
            }
         }
         return false;
      }
      
      public function dataChange() : void
      {
         if(this.parent)
         {
            this.parent.dispatchEvent(new TimelineEvent(TimelineEvent.UPDATE));
            this.parent._4016(this);
         }
      }
      
      public function clear() : void
      {
         this.frames.length = 0;
         this._selected = false;
      }
   }
}

