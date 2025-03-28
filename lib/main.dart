import 'package:flutter/material.dart';

void main() {
  runApp(TalkAlarmApp());
}

class TalkAlarmApp extends StatelessWidget {
  const TalkAlarmApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Talk Alarm',
      theme: ThemeData(
        brightness: Brightness.light,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: Color(0xFFECF1FF),
      ),
      themeMode: ThemeMode.light,
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido a Talk Alarm',
            style: TextStyle(color: Color(0xFF38388E))),
        backgroundColor: Color(0xFFECF1FF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.alarm, size: 100, color: Color(0xFF38388E)),
            SizedBox(height: 20),
            Text(
              'Despierta con un asistente conversacional.',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4B4AB0)),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'Configura tus alarmas, conversa con el asistente virtual, registra cómo te sientes y cuanto dormiste, amanece con tu agenda diaria,\n¡Ten un gran día!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Color(0xFF6B6CBE)),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF4B4AB0),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  child: Text('Log in',
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF4B4AB0),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  child: Text('Sign up',
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    AlarmListScreen(),
    AssistantSettingsScreen(),
    CalendarIntegrationScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Talk Alarm', style: TextStyle(color: Color(0xFF38388E))),
        backgroundColor: Color(0xFFECF1FF),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CreateEditAlarmScreen()),
            );
          },
          backgroundColor: Color(0xFF6B6CBE),
          child: Icon(Icons.add, color: Color(0xFFF5BDA4))),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        backgroundColor: Color(0xFFC5D4FF),
        indicatorColor: Color(0xFFA3B1FF),
        onDestinationSelected: _onItemTapped,
        destinations: const <NavigationDestination>[
          NavigationDestination(
            icon: Icon(Icons.cabin, color: Color(0xFF38388E)),
            label: 'Inicio',
            selectedIcon: Icon(Icons.cabin, color: Color(0xFF38388E)),
          ),
          NavigationDestination(
            icon: Icon(Icons.voice_chat, color: Color(0xFF38388E)),
            label: 'Asistente',
            selectedIcon: Icon(Icons.voice_chat, color: Color(0xFF38388E)),
          ),
          NavigationDestination(
            icon: Icon(Icons.calendar_month, color: Color(0xFF38388E)),
            label: 'Calendario',
            selectedIcon: Icon(Icons.calendar_month, color: Color(0xFF38388E)),
          ),
        ],
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      ),
    );
  }
}

class AlarmListScreen extends StatelessWidget {
  final List<Map<String, dynamic>> alarms = [
    {'time': '07:00 AM', 'assistant': true, 'repeat': 'Lun, Mar, Mie'},
    {'time': '08:30 PM', 'assistant': false, 'repeat': 'Jue, Vie'},
  ];

  AlarmListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: alarms.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.all(8),
          elevation: 2,
          color: Color(0xFFF8F9FA),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: ListTile(
            leading: Icon(Icons.alarm, color: Color(0xFF000000)),
            title: Text(alarms[index]['time'],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            subtitle: Text(
                '${alarms[index]['assistant'] ? 'Con asistente' : 'Sin asistente'} - Repite: ${alarms[index]['repeat']}',
                style: TextStyle(fontSize: 12, color: Color(0xFF38388E))),
            trailing: IconButton(
              icon:
                  Icon(Icons.delete_outline_outlined, color: Color(0xFFAB7E85)),
              onPressed: () {},
            ),
          ),
        );
      },
    );
  }
}

class CreateEditAlarmScreen extends StatelessWidget {
  const CreateEditAlarmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:
              Text('Crear Alarma', style: TextStyle(color: Color(0xFF38388E))),
          backgroundColor: Color(0xFFECF1FF)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                  labelText: 'Hora', prefixIcon: Icon(Icons.alarm)),
              readOnly: true,
              onTap: () async {
                await showTimePicker(
                    context: context, initialTime: TimeOfDay.now());
              },
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Días de repetición',
                  prefixIcon: Icon(Icons.repeat)),
              readOnly: true,
              onTap: () {},
            ),
            SizedBox(height: 16),
            SwitchListTile(
              activeColor: Color(0xFFC5D4FF),
              activeTrackColor: Color(0xFF38388E),
              title: Text('Activar asistente conversacional'),
              value: true,
              onChanged: (value) {},
            ),
            Spacer(),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              label: Text('Guardar', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF38388E),
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CreateDeleteAlarmScreen extends StatelessWidget {
  const CreateDeleteAlarmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:
              Text('Eliminar Alarma', style: TextStyle(color: Color(0xFF38388E))),
          backgroundColor: Color(0xFFECF1FF)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                  labelText: 'Hora', prefixIcon: Icon(Icons.alarm)),
              readOnly: true,
              enabled: false,
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                  labelText: 'Días de repetición',
                  prefixIcon: Icon(Icons.repeat)),
              readOnly: true,
              enabled: false,
            ),
            SizedBox(height: 16),
            SwitchListTile(
              activeColor: Color(0xFFC5D4FF),
              activeTrackColor: Color(0xFF38388E),
              title: Text('Asistente conversacional'),
              value: false,
              onChanged: null,
            ),
            Spacer(),
            ElevatedButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Confirmar'),
                      content: Text('¿Estás seguro de que deseas eliminar esta alarma?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('Cancelar'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context); 
                            Navigator.pop(context); 
                          },
                          child: Text('Eliminar', style: TextStyle(color: Colors.red)),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: Icon(Icons.delete, color: Colors.white),
              label: Text('Eliminar Alarma', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AssistantSettingsScreen extends StatelessWidget {
  const AssistantSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Configuración del Asistente',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          ListTile(
            leading: Icon(Icons.record_voice_over_outlined,
                color: Color(0xFFAB7E85)),
            title: Text('Voz del Asistente'),
            trailing: DropdownButton<String>(
              value: 'Femenina',
              onChanged: (String? newValue) {},
              items: ['Femenina', 'Masculina'].map((String value) {
                return DropdownMenuItem<String>(
                    value: value, child: Text(value));
              }).toList(),
            ),
          ),
          ListTile(
            leading: Icon(Icons.speed, color: Color(0xFFAB7E85)),
            title: Text('Velocidad de Habla'),
            trailing: SizedBox(
              width: 120,
              child: Slider(
                value: 0.5,
                onChanged: (value) {},
                activeColor: Color(0xFF38388E),
                inactiveColor: Color(0xFFC5D4FF),
              ),
            ),
          ),
          SwitchListTile(
            title: Text('Incluir eventos del calendario'),
            value: true,
            onChanged: (value) {},
            activeColor: Color(0xFFC5D4FF),
            activeTrackColor: Color(0xFF38388E),
          ),
          SwitchListTile(
            title: Text('Preguntar estado de ánimo'),
            value: true,
            onChanged: (value) {},
            activeColor: Color(0xFFC5D4FF),
            activeTrackColor: Color(0xFF38388E),
          ),
        ],
      ),
    );
  }
}

class AssistantCreateEditScreen extends StatelessWidget {
  const AssistantCreateEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Asistente', style: TextStyle(color: Color(0xFF38388E))),
        backgroundColor: Color(0xFFECF1FF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Nombre del Asistente',
                prefixIcon: Icon(Icons.person, color: Color(0xFFAB7E85)),
              ),
            ),
            SizedBox(height: 24),
            Text('Configuración de Voz',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            ListTile(
              leading: Icon(Icons.record_voice_over_outlined,
                  color: Color(0xFFAB7E85)),
              title: Text('Voz del Asistente'),
              trailing: DropdownButton<String>(
                value: 'Femenina',
                onChanged: (String? newValue) {},
                items: ['Femenina', 'Masculina'].map((String value) {
                  return DropdownMenuItem<String>(
                      value: value, child: Text(value));
                }).toList(),
              ),
            ),
            ListTile(
              leading: Icon(Icons.speed, color: Color(0xFFAB7E85)),
              title: Text('Velocidad de Habla'),
              trailing: SizedBox(
                width: 120,
                child: Slider(
                  value: 0.5,
                  onChanged: (value) {},
                  activeColor: Color(0xFF38388E),
                  inactiveColor: Color(0xFFC5D4FF),
                ),
              ),
            ),
            SizedBox(height: 24),
            Text('Personalización',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            SwitchListTile(
              title: Text('Incluir eventos del calendario'),
              value: true,
              onChanged: (value) {},
              activeColor: Color(0xFFC5D4FF),
              activeTrackColor: Color(0xFF38388E),
            ),
            SwitchListTile(
              title: Text('Preguntar estado de ánimo'),
              value: true,
              onChanged: (value) {},
              activeColor: Color(0xFFC5D4FF),
              activeTrackColor: Color(0xFF38388E),
            ),
            SwitchListTile(
              title: Text('Recordatorios personalizados'),
              value: false,
              onChanged: (value) {},
              activeColor: Color(0xFFC5D4FF),
              activeTrackColor: Color(0xFF38388E),
            ),
            Spacer(),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.save, color: Colors.white),
              label: Text('Guardar Cambios', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF38388E),
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CalendarIntegrationScreen extends StatelessWidget {
  const CalendarIntegrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Conexión con Calendarios',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 16),
          ListTile(
            leading:
                Icon(Icons.calendar_today_outlined, color: Color(0xFFAB7E85)),
            title: Text('Google Calendar'),
            trailing: Switch(
              value: true,
              onChanged: (value) {},
              activeColor: Color(0xFFC5D4FF),
              activeTrackColor: Color(0xFF38388E),
            ),
          ),
          ListTile(
            leading: Icon(Icons.event_note_outlined, color: Color(0xFFAB7E85)),
            title: Text('Outlook Calendar'),
            trailing: Switch(
              value: true,
              onChanged: (value) {},
              activeColor: Color(0xFFC5D4FF),
              activeTrackColor: Color(0xFF38388E),
            ),
          ),
          SizedBox(height: 30),
          Text('Eventos próximos',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  color: Color(0xFFF8F9FA),
                  child: ListTile(
                    leading:
                        Icon(Icons.event_outlined, color: Color(0xFF38388E)),
                    title: Text('Reunión de equipo',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(
                      '10:00 AM - 11:00 AM',
                      style: TextStyle(color: Color(0xFF38388E)),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CalendarCreateEventScreen extends StatelessWidget {
  const CalendarCreateEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear Evento', style: TextStyle(color: Color(0xFF38388E))),
        backgroundColor: Color(0xFFECF1FF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Título del Evento',
                prefixIcon: Icon(Icons.event_note, color: Color(0xFFAB7E85)),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Fecha',
                prefixIcon: Icon(Icons.calendar_today, color: Color(0xFFAB7E85)),
              ),
              readOnly: true,
              onTap: () async {
                await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(Duration(days: 365)),
                );
              },
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Hora inicio',
                      prefixIcon: Icon(Icons.access_time, color: Color(0xFFAB7E85)),
                    ),
                    readOnly: true,
                    onTap: () async {
                      await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                    },
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Hora fin',
                      prefixIcon: Icon(Icons.access_time, color: Color(0xFFAB7E85)),
                    ),
                    readOnly: true,
                    onTap: () async {
                      await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now().replacing(
                          hour: (TimeOfDay.now().hour + 1) % 24,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Descripción',
                prefixIcon: Icon(Icons.description, color: Color(0xFFAB7E85)),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 16),
            Text('Calendario', 
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ListTile(
              leading: Icon(Icons.calendar_today_outlined, color: Color(0xFFAB7E85)),
              title: Text('Google Calendar'),
              trailing: Radio(
                value: 'google',
                groupValue: 'google',
                onChanged: (value) {},
                activeColor: Color(0xFF38388E),
              ),
            ),
            ListTile(
              leading: Icon(Icons.event_note_outlined, color: Color(0xFFAB7E85)),
              title: Text('Outlook Calendar'),
              trailing: Radio(
                value: 'outlook',
                groupValue: 'google',
                onChanged: (value) {},
                activeColor: Color(0xFF38388E),
              ),
            ),
            Spacer(),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.save, color: Colors.white),
              label: Text('Guardar Evento', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF38388E),
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
