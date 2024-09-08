package _648
{
   import _1331._1332;
   import egret.utils._1549;
   
   public class _12463
   {
      public function _12463()
      {
         this.egret = _1332.instance;
         super();
      }
      
      public function get _3766() : Boolean
      {
         return _1332._3766;
      }
      
      public function get _12691() : String
      {
         return this.config.get("uuid");
      }
      
      public function get _12675() : Boolean
      {
         if(!this.config.has("autoLogin"))
         {
            this._12675 = Boolean(this.password);
         }
         return Boolean(this.config.get("autoLogin"));
      }
      
      public function set _12675(param1:Boolean) : void
      {
         this.config.set("autoLogin",param1 ? "1" : "");
      }
      
      public function get autoLogin2() : Boolean
      {
         if(!this.config.has("autoLogin2"))
         {
            this.autoLogin2 = this._12675;
         }
         return Boolean(this.config.get("autoLogin2"));
      }
      
      public function set autoLogin2(param1:Boolean) : void
      {
         this.config.set("autoLogin2",param1 ? "1" : "");
      }
      
      public function get config() : _1549
      {
         return this.egret._3755;
      }
      
      public function get uid() : String
      {
         return this.config.get("uid");
      }
      
      public function get level() : int
      {
         return this.config.get("level");
      }
      
      public function get paid() : Boolean
      {
         return Boolean(int(this.config.get("paid")) > 0);
      }
      
      public function get statistics() : String
      {
         return this.config.get("statistics") || "";
      }
      
      public function get token() : String
      {
         return this.config.get("token") || "";
      }
      
      public function get mail() : String
      {
         return this.config.get("username") || "";
      }
      
      public function set mail(param1:String) : void
      {
         this.config.set("username",param1);
      }
      
      public function get password() : String
      {
         return this.config.get("password") || "";
      }
      
      public function set password(param1:String) : void
      {
         this.config.set("password",param1);
      }
      
      public function get leaveMeAlone() : int
      {
         return this.config.get("leaveMeAlone");
      }
      
      public function set leaveMeAlone(param1:int) : void
      {
         this.config.set("leaveMeAlone",param1);
      }
   }
}

