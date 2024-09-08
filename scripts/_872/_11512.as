package _872
{
   import _1045.Button;
   import _1045.Group;
   import _1177.CloseEvent;
   import _11845._11950;
   import _120._119;
   import _120._121;
   import _1374.Alert;
   import _1404._1407;
   import _648._11507;
   import _97._125;
   import egret.utils._1526;
   import egret.utils.tr;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class _11512 extends Group
   {
      private var _11833:Boolean = false;
      
      private var _11834:uint = 0;
      
      private var _11841:uint = 0;
      
      private var _11838:String = null;
      
      private var _11837:_119 = null;
      
      private var _11836:Alert = null;
      
      public function _11512()
      {
         this.button = new Button();
         this._timer = new Timer(1000);
         this._tip = new TaskTip();
         this._queueGroup = _125._2413(0);
         this._4761 = _1407.getInstance(_11507) as _11507;
         super();
      }
      
      override protected function _2438() : void
      {
         super._2438();
         this.button.visible = false;
         this.button.includeInLayout = false;
         this.button.label = tr("Export.taskQueue");
         this._tip.right = 0;
         this._tip.visible = false;
         this._queueGroup.right = 0;
         this._queueGroup.visible = false;
         this.top = 45;
         this.right = 10;
         this.addElement(this._queueGroup);
         this.addElement(this._tip);
         this._4761.taskQueue.addEventListener(_121.SUB_START,this._11832);
         this._4761.taskQueue.addEventListener(_121.SUB_COMPLETE,this._11832);
         this._4761.taskQueue.addEventListener(_121.COMPLETE,this._11832);
         this._4761.taskQueue.addEventListener(_121.FAIL,this._11832);
         this._4761.taskQueue.addEventListener(_121.PROGRESS,this._11832);
         this._timer.addEventListener(TimerEvent.TIMER,this._11587);
         this._timer.start();
         this._tip.label.addEventListener(MouseEvent.CLICK,this._11456);
         this._tip.buttonClose.addEventListener(MouseEvent.CLICK,this._11456);
         this._tip.addEventListener(MouseEvent.ROLL_OVER,this._11768);
         this._tip.addEventListener(MouseEvent.ROLL_OUT,this._11768);
         this.button.addEventListener(MouseEvent.CLICK,this._11456);
      }
      
      private function _11768(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.ROLL_OVER:
               this._11833 = false;
               this._tip.buttonClose.visible = true;
               break;
            case MouseEvent.ROLL_OUT:
               this._11833 = true;
               this._tip.buttonClose.visible = false;
         }
      }
      
      private function _11456(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this._tip.label:
               if(this._11838)
               {
                  _1526._10168(this._11838);
               }
               this._11840(null);
               break;
            case this._tip.buttonClose:
               this._11840(null);
               break;
            case this.button:
               this._11839(!this._queueGroup.visible);
         }
      }
      
      private function _9529(param1:Event) : void
      {
         if(param1 is CloseEvent)
         {
            if((param1 as CloseEvent).detail === Alert.FIRST_BUTTON && Boolean(this._11837))
            {
               this._4761.taskQueue._11548(this._11837);
               this._11835();
            }
            this._11837 = null;
            this._11836 = null;
         }
         else
         {
            this._11837 = (param1.currentTarget as TaskView).task;
            if(this._11837)
            {
               this._11836 = Alert.show(tr("Export.cancelToEgret.message",this._11837._11537.name,TaskView.getDateString(this._11837._11537.date)),tr("Export.cancelToEgret.title"),null,this._9529,tr("Alert.Confirm"),tr("Alert.Cancel"));
            }
         }
      }
      
      private function _11832(param1:_121) : void
      {
         var _loc2_:_119 = null;
         switch(param1.type)
         {
            case _121.SUB_START:
               this.button.visible = true;
               this.button.includeInLayout = true;
               this.button.alpha = 1;
               _11950._12409(this.button);
               _11950.to(this.button,10,{
                  "alpha":0,
                  "yoyo":true,
                  "repeat":7,
                  "useFrames":true,
                  "delay":10
               });
               this._11835();
               this._11840(null);
               break;
            case _121.COMPLETE:
               this.button.visible = false;
               this.button.includeInLayout = false;
               this._11839(false);
               break;
            case _121.PROGRESS:
               break;
            case _121.SUB_COMPLETE:
               _loc2_ = param1.data as _119;
               this._11838 = _loc2_._11537.outputFile;
               this._11840(tr("Export.toEgretCompleted",_loc2_._11537.name,_loc2_._11537.outputPath),30000);
               this._11835();
               if(this._11837 && this._11837 === _loc2_ && Boolean(this._11836))
               {
                  this._11836.close();
                  this._11837 = null;
                  this._11836 = null;
               }
               break;
            case _121.FAIL:
               this._11835();
               if(param1.data.type === "busy")
               {
                  Alert.show(tr("Export.toEgret.error.busy"),tr("Export.toEgret.error.title"));
               }
               else
               {
                  Alert.show(tr("Export.toEgret.error.other",param1.data.type));
               }
         }
      }
      
      private function _11587(param1:Event) : void
      {
         var _loc4_:TaskView = null;
         var _loc2_:uint = 0;
         var _loc3_:uint = uint(this._queueGroup._2249);
         while(_loc2_ < _loc3_)
         {
            _loc4_ = this._queueGroup.getElementAt(_loc2_) as TaskView;
            if(_loc4_)
            {
               _loc4_.update();
            }
            _loc2_++;
         }
         if(this._11833 && this._11834 > 0)
         {
            if(this._timer.currentCount * this._timer.delay - this._11841 > this._11834)
            {
               this._11834 = 0;
               this._11841 = 0;
               this._11840(null);
            }
         }
      }
      
      private function _11840(param1:String, param2:uint = 0) : void
      {
         if(param1)
         {
            this._11834 = param2;
            this._11841 = this._timer.currentCount * this._timer.delay;
            this._tip.label.text = param1;
            this._tip.visible = true;
            this._tip.buttonMode = true;
            this._tip.useHandCursor = true;
            this.addElement(this._tip);
         }
         else
         {
            this._11833 = true;
            this._11834 = 0;
            this._11841 = 0;
            this._tip.visible = false;
         }
      }
      
      private function _11835() : void
      {
         var _loc1_:_119 = null;
         var _loc2_:TaskView = null;
         this._queueGroup._2426();
         for each(_loc1_ in this._4761.taskQueue.runingTasks)
         {
            _loc2_ = new TaskView();
            _loc2_.task = _loc1_;
            _loc2_.update();
            _loc2_.addEventListener(Event.CLOSE,this._9529);
            this._queueGroup.addElement(_loc2_);
         }
         this.button.toolTip = tr("Export.queueTip",this._4761.taskQueue.runingTasks.length);
      }
      
      public function _11839(param1:Boolean) : void
      {
         if(param1)
         {
            this._queueGroup.visible = true;
         }
         else
         {
            this._queueGroup.visible = false;
         }
      }
   }
}

import _1045.Group;
import _1045.Label;
import _1374.IconButton;
import _97._100;
import _97._125;
import egret.core._1140;

class TaskTip extends Group
{
   public function TaskTip()
   {
      this.label = new Label();
      this.buttonClose = new IconButton();
      this.background = new _1140();
      super();
   }
   
   override protected function _2438() : void
   {
      var _loc1_:Group = null;
      super._2438();
      this.width = 300;
      this.height = 80;
      _loc1_ = _125._2403();
      this.label.percentWidth = 100;
      this.label.percentHeight = 100;
      this.buttonClose.icon = "/assets/panelIcon/cross.png";
      this.buttonClose.visible = false;
      _loc1_.top = 5;
      _loc1_.bottom = 5;
      _loc1_.left = 5;
      _loc1_.right = 5;
      _loc1_.addElement(this.label);
      _loc1_.addElement(this.buttonClose);
      this.background.percentWidth = 100;
      this.background.percentHeight = 100;
      this.background.graphics.beginFill(0);
      this.background.graphics.lineStyle(0,_100.SYMBOL_BORDER_COLOR);
      this.background.graphics.drawRect(0,0,this.width,this.height);
      this.addElement(this.background);
      this.addElement(_loc1_);
   }
}

import _1045.Group;
import _1045.Label;
import _120._119;
import _1374.IconButton;
import _97._100;
import _97._125;
import egret.core._1140;
import egret.utils.tr;
import flash.events.Event;
import flash.events.MouseEvent;

class TaskView extends Group
{
   public var task:_119 = null;
   
   public function TaskView()
   {
      this.label = new Label();
      this.buttonCancel = new IconButton();
      this.background = new _1140();
      super();
   }
   
   public static function getDateString(param1:Date) : String
   {
      if(param1.hoursUTC > 0)
      {
         return tr("Date.HMS",param1.hoursUTC,param1.minutesUTC,param1.secondsUTC);
      }
      if(param1.minutesUTC > 0)
      {
         return tr("Date.MS",param1.minutesUTC,param1.secondsUTC);
      }
      return tr("Date.S",param1.secondsUTC);
   }
   
   override protected function _2438() : void
   {
      super._2438();
      this.width = 250;
      this.height = 50;
      var _loc1_:Group = _125._2403();
      this.label.percentWidth = 100;
      this.label.percentHeight = 100;
      this.buttonCancel.icon = "/assets/panelIcon/cross.png";
      this.buttonCancel.toolTip = tr("Export.cancel");
      _loc1_.top = 5;
      _loc1_.bottom = 5;
      _loc1_.left = 5;
      _loc1_.right = 5;
      _loc1_.addElement(this.label);
      _loc1_.addElement(this.buttonCancel);
      this.background.percentWidth = 100;
      this.background.percentHeight = 100;
      this.background.graphics.beginFill(_100.backgroundColor);
      this.background.graphics.lineStyle(0,_100.SYMBOL_BORDER_COLOR);
      this.background.graphics.drawRect(0,0,this.width,this.height);
      this.addElement(this.background);
      this.addElement(_loc1_);
      this.buttonCancel.addEventListener(MouseEvent.CLICK,this._11456);
   }
   
   private function _11456(param1:MouseEvent) : void
   {
      this.dispatchEvent(new Event(Event.CLOSE));
   }
   
   public function update() : void
   {
      if(!this.task)
      {
         return;
      }
      var _loc1_:Date = new Date();
      _loc1_.time -= this.task._11537.date.time;
      this.label.text = tr("Export.toEgret",this.task._11537.name,getDateString(_loc1_));
   }
}

