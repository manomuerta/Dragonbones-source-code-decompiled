package _586
{
   import _1404._1407;
   import _472._607;
   import _51._52;
   import _51._79;
   import _579._580;
   import _708._714;
   import _708._715;
   import _783.CommandNotification;
   import _783.StageNotification;
   import _81._85;
   import _81._91;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class _602 extends _599
   {
      protected var _5324:_91;
      
      public function _602()
      {
         super();
      }
      
      override protected function dispose() : void
      {
         super.dispose();
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this._5321);
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,_5277);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this._5322);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this._5103);
         this._5324 = null;
         _2938 = null;
      }
      
      override protected function _5103(param1:MouseEvent) : void
      {
         super._5103(param1);
         _607.instance._5059(true);
      }
      
      protected function _5016() : void
      {
         var _loc1_:Array = null;
         var _loc2_:Object = null;
         var _loc3_:Array = null;
         if(this._5012 && (this._5012 is _52 || _2873 != _715.ANIMATE) && !this._5324 && !_2938 && _2220._4000 != _714.PLAY)
         {
            _5113 = new Point(stage.mouseX,stage.mouseY);
            _2549 = this._5301;
            if(_2226._2889.indexOf(this._5012) == -1)
            {
               this._5323(this._5012 is _79 && _2873 == _715.GENERAL ? (this._5012 as _79).parentBoneData : this._5012);
            }
            else
            {
               _loc1_ = [];
               for each(_loc2_ in _2226._2889)
               {
                  if(_loc2_ is _52)
                  {
                     if(_52(_loc2_)._1980 && _52(_loc2_).parentBoneData && _52(_loc2_).parentBoneData._1980)
                     {
                        if(_52(_loc2_).rootArmatureData._1955(_52(_loc2_),_52(_loc2_).parentBoneData))
                        {
                           continue;
                        }
                     }
                  }
                  _loc1_.push(_loc2_);
               }
               _loc3_ = _2199(_loc1_,1,_2873 == _715.ANIMATE ? 2 : 1,_2873 == _715.GENERAL);
               switch(_10760)
               {
                  case TRANSFORM_FREE:
                  case TRANSFORM_TRANSLATE:
                     _5111(_loc3_);
                     break;
                  case TRANSFORM_ROTATE:
                     _5117(_loc3_);
                     break;
                  case TRANSFORM_SCALE:
                     _10783(_loc3_);
               }
            }
            _1567(new StageNotification(StageNotification.START_MOVE_BONE));
         }
      }
      
      protected function _5323(param1:_91) : void
      {
         stage.addEventListener(MouseEvent.MOUSE_MOVE,this._5321);
         stage.addEventListener(MouseEvent.MOUSE_UP,this._5322);
         this._5324 = param1;
      }
      
      protected function _5321(param1:MouseEvent) : void
      {
         var _loc4_:_91 = null;
         var _loc2_:Point = new Point(param1.stageX,param1.stageY);
         var _loc3_:Number = _85._2185(_5113,_loc2_);
         if(_loc3_ >= 10)
         {
            stage.removeEventListener(MouseEvent.MOUSE_MOVE,this._5321);
            _1567(new CommandNotification(CommandNotification.SELECT_ITEMS,[this._5324]));
            _5113.x = param1.stageX;
            _5113.y = param1.stageY;
            _loc4_ = this._5324;
            this._5324 = null;
            if(_loc4_ is _52)
            {
               if(_52(_loc4_)._1980 && _52(_loc4_).parentBoneData && _52(_loc4_).parentBoneData._1980)
               {
                  if(_52(_loc4_).rootArmatureData._1955(_52(_loc4_),_52(_loc4_).parentBoneData))
                  {
                     return;
                  }
               }
            }
            this._10785(_2199([_loc4_],0,0,_2873 == _715.GENERAL));
         }
      }
      
      protected function _10785(param1:Array) : void
      {
         switch(_10760)
         {
            case TRANSFORM_FREE:
            case TRANSFORM_TRANSLATE:
               _5111(param1);
               break;
            case TRANSFORM_ROTATE:
               _5117(param1);
               break;
            case TRANSFORM_SCALE:
               _10783(param1);
         }
      }
      
      protected function _5322(param1:MouseEvent) : void
      {
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this._5321);
         stage.removeEventListener(MouseEvent.MOUSE_UP,this._5322);
         this._5324 = null;
         _1567(new StageNotification(StageNotification.STOP_MOVE_BONE));
      }
      
      public function get _5012() : _91
      {
         return null;
      }
      
      protected function get _3176() : _580
      {
         return _1407.getInstance(_580);
      }
      
      protected function get _5301() : Point
      {
         return (_1407.getInstance(_600) as _600)._5294;
      }
   }
}

