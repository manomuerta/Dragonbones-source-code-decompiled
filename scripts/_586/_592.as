package _586
{
   import _1038._1037;
   import _1038._1039;
   import _127._131;
   import _1404._1407;
   import _573.TimelinePanelController;
   import _708._715;
   import _783.CommandNotification;
   import _81._91;
   import _97._103;
   import flash.geom.Point;
   
   public class _592 extends _602
   {
      protected var _5017:_131;
      
      protected var _5005:String;
      
      protected var _5004:String;
      
      protected var _5006:String;
      
      protected var _5007:String;
      
      protected var _11406:String;
      
      public function _592()
      {
         super();
      }
      
      override public function start() : void
      {
         super.start();
         this.refresh();
      }
      
      override protected function _1576() : void
      {
      }
      
      override protected function dispose() : void
      {
         super.dispose();
      }
      
      public function refresh() : void
      {
         var _loc2_:Object = null;
         if(this._5017 == null)
         {
            return;
         }
         var _loc1_:_1039 = this._5017.dataProvider;
         if(_loc1_)
         {
            for each(_loc2_ in _loc1_)
            {
               _103.addItem(_loc2_);
            }
            (_loc1_ as _1037).refresh();
         }
      }
      
      public function set _5143(param1:_131) : void
      {
         if(this._5017 == param1)
         {
            return;
         }
         if(this._5017)
         {
            this.dispose();
         }
         this._5017 = param1;
         if(this._5017)
         {
            this.start();
         }
      }
      
      override public function get _4763() : String
      {
         if(_2873 == _715.ARMATURE)
         {
            return this._5005;
         }
         if(_2873 == _715.ANIMATE)
         {
            if(this._2852.adjusting)
            {
               return this._11406;
            }
            return this._5004;
         }
         if(_2873 == _715.GENERAL)
         {
            return this._5006;
         }
         if(_2873 == _715.COMIC)
         {
            return this._5007;
         }
         if(_2873 == _715.SHEET)
         {
            return CommandNotification.MODIFY_SHEET_TRANSFORM;
         }
         return "";
      }
      
      override protected function _10785(param1:Array) : void
      {
         var _loc2_:_91 = null;
         switch(_10760)
         {
            case TRANSFORM_FREE:
            case TRANSFORM_TRANSLATE:
               _5111(param1);
               break;
            case TRANSFORM_ROTATE:
               _loc2_ = param1[0] as _91;
               if(Boolean(this._5017) && Boolean(_loc2_))
               {
                  _2549 = this._5017.localToGlobal(new Point(_loc2_.globalTransform.x,_loc2_.globalTransform.y));
               }
               _5117(param1);
               break;
            case TRANSFORM_SCALE:
               _10783(param1);
         }
      }
      
      public function get _2852() : TimelinePanelController
      {
         return _1407.getInstance(TimelinePanelController) as TimelinePanelController;
      }
   }
}

